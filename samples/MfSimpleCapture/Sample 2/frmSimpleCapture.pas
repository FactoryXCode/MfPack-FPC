// FactoryX
//
// Copyright © FactoryX, Netherlands/Australia
//
// Project: Media Foundation - MFPack - Samples
// Project location: http://sourceforge.net/projects/MFPack
// Module: frmSimpleCapture.pas
// Kind: Pascal Unit
// Release date: 21/09/2024
// Language: ENU
//
// Revision Version: 4.1.0
//
// Description: This is sample 2 of SimpleCapture that shows you how to implement
//              IAMCameraControl and IAMVideoProcAmp to control camera and video.
//
//
// Company: FactoryX
// Intiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX),
//                 Peter Larson (ozships),
//                 Ciaran (Ciaran3)
//
//------------------------------------------------------------------------------
// CHANGE LOG
// Date       Person              Reason
// ---------- ------------------- ----------------------------------------------
// 15/11/2026 All                 Eels release  SDK 10.0.28000.2705 (Windows 11)
//------------------------------------------------------------------------------
//
// Remarks: Requires Windows 8 or higher.
//
// Related objects: -
// Related projects: MfPackX410
// Known Issues: -
//
// Compiler version: FPC 3.2.2 / Lazarus 4.8 (Windows x64).
// SDK version: 10.0.28000.2705
//
// Todo: -
//
// =============================================================================
// Source: Parts of CPreview Examples.
//
// Copyright (c) Microsoft Corporation. All rights reserved.
// FactoryX, Copyright (c) FactoryX. All rights reserved.
//==============================================================================
//
// LICENSE
//
// The contents of this file are subject to the Mozilla Public License
// Version 2.0 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// https://www.mozilla.org/en-US/MPL/2.0/
//
// Software distributed under the License is distributed on an "AS IS"
// basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
// License for the specific language governing rights and limitations
// under the License.
//
// Non commercial users may distribute this sourcecode provided that this
// header is included in full at the top of the file.
// Commercial users are not allowed to distribute this sourcecode as part of
// their product.
//
//==============================================================================
unit frmSimpleCapture;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

interface

uses
  LMessages,

  {WinApi}
  Windows,
  Messages,
  WinApi.Ks,
  WinApi.KsMedia,
  WinApi.ComBaseApi,
  WinApi.WinApiTypes,
  {System}
  System.Services.Dbt,
  SysUtils,
  Variants,
  Classes,
  {LCL}
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  {ActiveX}
  WinApi.ActiveX.ObjBase,
  {DirectShow}
  WinApi.StrmIf,
  {MediaFoundationApi}
  WinApi.MediaFoundationApi.MfApi,
  WinApi.MediaFoundationApi.MfIdl,
  WinApi.MediaFoundationApi.MfPlay,
  WinApi.MediaFoundationApi.MfObjects,
  WinApi.MediaFoundationApi.MfUtils,
  WinApi.MediaFoundationApi.MfMetLib,
  {Application}
  frmdlgChooseDevice,
  MfDeviceCaptureClass,
  MfCaptureDevices;

type

  TFrm_SimpleCapture = class(TForm)
    pnlControls: TPanel;
    Button1: TButton;
    butGetDevice: TButton;
    pnlVideo: TPanel;
    pnlCameraAndVideoControl: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cbxCameraControlProperty: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    cbxVideoControlProperty: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    cbxCameraControlFlags: TComboBox;
    Label7: TLabel;
    cbxVideoControlFlags: TComboBox;
    Label8: TLabel;
    lblRotation: TLabel;
    cboRotation: TComboBox;
    cbxCameraValues: TComboBox;
    butShowProperties: TButton;
    cbxVideoValues: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure pnlVideoResize(Sender: TObject);
    procedure butGetDeviceClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject;
                             var CanClose: Boolean);
    procedure HandleRotationChanged(Sender: TObject);
    procedure cbxCameraControlPropertySelect(Sender: TObject);
    procedure cbxVideoControlPropertySelect(Sender: TObject);
    procedure cbxCameraControlFlagsSelect(Sender: TObject);
    procedure cbxCameraValuesSelect(Sender: TObject);
    procedure butShowPropertiesClick(Sender: TObject);
    procedure cbxVideoValuesSelect(Sender: TObject);

  private
    { Private declarations }
    //p_hdevnotify: HDEVNOTIFY;
    MfDeviceCapture: TMfCaptureEngine;
    FCaptureDevices: TMfCaptureDevices;
    FSelectedDeviceName: string;
    bAppIsClosing: Boolean;
    bFullScreenMode: Boolean;
    iSelectedDevice: Integer;

    // Camera & video control.
    fSelectedCamaraControl: TCameraPropSet;
    fSelectedVideoControl: TVideoPropSet;

    // Quits the session and releases the capture engine
    procedure QuitSession();
    function GetFmCapture(): HRESULT;

    procedure SetCbxValues(pCbx: TComboBox;
                           iContrPropIndex,
                           iMax,
                           iMin,
                           iStep,
                           iDefault,
                           iFlags: Integer;
                           pCtl: LONG);

    function SetCameraProperties(pIndex: Integer): HRESULT;
    function SetVideoProperties(pIndex: Integer): HRESULT;

    procedure SetCameraPropFlags();
    procedure SetVideoPropFlags();

    // Listen for WM_DEVICECHANGE messages.
    // The lParam message parameter is a pointer to a DEV_BROADCAST_HDR structure.
    procedure WMDeviceChange(var Msg: TMessage); message WM_DEVICECHANGE;

  public
    { Public declarations }

    bDeviceLost: Boolean;

  end;

var
  Frm_SimpleCapture: TFrm_SimpleCapture;


implementation

{$R *.lfm}


//-------------------------------------------------------------------
// CleanUp: Frees resources before the application exits
//-------------------------------------------------------------------
procedure TFrm_SimpleCapture.QuitSession();

begin

  if Assigned(MfDeviceCapture) then
    begin
      MfDeviceCapture.ShutDownEngine();
      FreeAndNil(MfDeviceCapture);
    end;
end;


// TEST

procedure TFrm_SimpleCapture.SetCbxValues(pCbx: TComboBox;
                                          iContrPropIndex,
                                          iMax,
                                          iMin,
                                          iStep,
                                          iDefault,
                                          iFlags: Integer;
                                          pCtl: LONG);
var
  Steps: Int64;
  Value, Flags, I: Integer;
  Status: HRESULT;

begin

  if (iStep <= 0) or (iMax < iMin) then
    Exit;
  Steps := (Int64(iMax) - iMin) div iStep + 1;
  if Steps > 10000 then
    Exit;
  Value := iDefault;
  Flags := iFlags;
  if pCbx = cbxCameraValues then
    Status := MfDeviceCapture.GetCameraValue(pCtl,
                                             Value,
                                             Flags)
  else
    Status := MfDeviceCapture.GetVideoValue(pCtl,
                                            Value,
                                            Flags);
  if FAILED(Status) then
    begin
      Value := iDefault;
      if (iFlags and 2) <> 0 then
        Flags := 2
      else
        Flags := 1;
    end;
  pCbx.Clear;
  for I := 0 to Integer(Steps) - 1 do
    pCbx.Items.Add(IntToStr(Int64(iMin) + Int64(I) * iStep));
  pCbx.ItemIndex := pCbx.Items.IndexOf(IntToStr(Value));
  if pCbx.ItemIndex < 0 then
    pCbx.Text := IntToStr(Value);
  pCbx.Enabled := True;
  if pCbx = cbxCameraValues then
    begin
      fSelectedCamaraControl.cpCameraControlProperty := pCtl;
      fSelectedCamaraControl.cpValue := Value;
      fSelectedCamaraControl.cpFlags := Flags;
      cbxCameraControlProperty.ItemIndex := iContrPropIndex;
      cbxCameraControlFlags.Enabled := True;
      cbxCameraControlFlags.ItemIndex := Ord((Flags and LONG(CameraControl_Flags_Manual)) <> 0);
    end
  else
    begin
      fSelectedVideoControl.cpVideoProcAmpProperty := pCtl;
      fSelectedVideoControl.cpValue := Value;
      fSelectedVideoControl.cpFlags := Flags;
      cbxVideoControlProperty.ItemIndex := iContrPropIndex;
      cbxVideoControlFlags.Enabled := True;
      cbxVideoControlFlags.ItemIndex := Ord((Flags and LONG(VideoProcAmp_Flags_Manual)) <> 0);
    end;
end;


procedure TFrm_SimpleCapture.butGetDeviceClick(Sender: TObject);
var
  hr: HRESULT;

begin

  if not Assigned(dlgChooseDevice) then
    Application.CreateForm(TdlgChooseDevice,
                           dlgChooseDevice);

  SetLength(FDevicePropertiesArray,
            0);
  hr := FCaptureDevices.Refresh();
  FDevicePropertiesArray := FCaptureDevices.Devices;

  if FAILED(hr) then
    Exit;

  if (dlgChooseDevice.ShowModal <> 111) then
    Exit;

  iSelectedDevice := dlgChooseDevice.iSelectedDevice;
  if (iSelectedDevice < 0) or (iSelectedDevice >= Length(FDevicePropertiesArray)) then
    Exit;

  if not Assigned(MfDeviceCapture) then
    begin
      hr := GetFmCapture();
      if FAILED(hr) then
        Exit;
    end;

  FSelectedDeviceName := string(FDevicePropertiesArray[iSelectedDevice].lpFriendlyName);
  // Set the selected device.
  MfDeviceCapture.Rotation := cboRotation.ItemIndex * 90;
  hr := MfDeviceCapture.SetDevice(FDevicePropertiesArray[iSelectedDevice]);
  if FAILED(hr) then
    begin
      MessageBoxW(Handle,
                  PWideChar('Opening capture device failed ($' + IntToHex(Cardinal(hr),
                                                                          8) + ').'),
                  'Capture device',
                  MB_OK or MB_ICONERROR);
      Exit;
    end;

  butShowProperties.Enabled := True;

  // Get the device properties.
  hr := SetCameraProperties(4);  // Exposure.
  if FAILED(hr) then
    begin
      MessageBoxW(0,
                  lpcwstr('Set camera properties failed with error code: ' + IntToStr(hr) + ''),
                  lpcwstr('Camera properties Failure!'),
                  MB_ICONSTOP);
      Exit;
    end;

  hr := SetVideoProperties(0); // Brightness.
  if FAILED(hr) then
    begin
      MessageBoxW(0,
                  lpcwstr('Set video properties failed with error code: ' + IntToStr(hr) + ''),
                  lpcwstr('Video properties Failure!'),
                  MB_ICONSTOP);
    end;
end;


procedure TFrm_SimpleCapture.Button1Click(Sender: TObject);

begin

  Close();
end;


procedure TFrm_SimpleCapture.butShowPropertiesClick(Sender: TObject);

begin

  if Assigned(MfDeviceCapture) and not pnlCameraAndVideoControl.Visible then
    pnlCameraAndVideoControl.Visible := True
  else
    pnlCameraAndVideoControl.Visible := False;
end;


procedure TFrm_SimpleCapture.SetCameraPropFlags();

begin

  case cbxCameraControlFlags.ItemIndex of
    0: fSelectedCamaraControl.cpFlags := LONG(CameraControl_Flags_Auto);
    1: fSelectedCamaraControl.cpFlags := LONG(CameraControl_Flags_Manual);
  end;
end;


procedure TFrm_SimpleCapture.SetVideoPropFlags();

begin

  case cbxVideoControlFlags.ItemIndex of
    0: fSelectedVideoControl.cpFlags := LONG(VideoProcAmp_Flags_Auto);
    1: fSelectedVideoControl.cpFlags := LONG(VideoProcAmp_Flags_Manual);
  end;
end;


procedure TFrm_SimpleCapture.cbxCameraControlFlagsSelect(Sender: TObject);

begin

  SetCameraPropFlags();
  cbxCameraValuesSelect(Sender);
end;


procedure TFrm_SimpleCapture.cbxCameraControlPropertySelect(Sender: TObject);

begin

  if FAILED(SetCameraProperties(cbxCameraControlProperty.ItemIndex)) then
    MessageBoxW(0,
                lpcwstr('Could not get camera property, because the engine in not initialized.'),
                lpcwstr('Failure'),
                MB_ICONSTOP);
end;


procedure TFrm_SimpleCapture.cbxCameraValuesSelect(Sender: TObject);
var
  hr: HRESULT;

begin

  if not Assigned(MfDeviceCapture) or not cbxCameraValues.Enabled or
     not TryStrToInt(cbxCameraValues.Text,
                     fSelectedCamaraControl.cpValue) then
    Exit;
  SetCameraPropFlags();

  hr := MfDeviceCapture.SetCameraProps(fSelectedCamaraControl);

  if FAILED(hr) and (hr <> E_POINTER) then
    MessageBoxW(0,
                lpcwstr('Could not set camera property.'),
                lpcwstr('Failure'),
                MB_ICONSTOP);
end;


procedure TFrm_SimpleCapture.cbxVideoControlPropertySelect(Sender: TObject);

begin

  if FAILED(SetVideoProperties(cbxVideoControlProperty.ItemIndex)) then
    MessageBoxW(0,
                lpcwstr('Could not get camera property, because the engine in not initialized.'),
                lpcwstr('Failure'),
                MB_ICONSTOP);
end;


procedure TFrm_SimpleCapture.cbxVideoValuesSelect(Sender: TObject);
var
  hr: HRESULT;

begin

  if not Assigned(MfDeviceCapture) or not cbxVideoValues.Enabled or
     not TryStrToInt(cbxVideoValues.Text,
                     fSelectedVideoControl.cpValue) then
    Exit;
  SetVideoPropFlags();

  hr := MfDeviceCapture.SetVideoProps(fSelectedVideoControl);

  if FAILED(hr) and (hr <> E_POINTER) then
    MessageBoxW(0,
                lpcwstr('Could not set video property.'),
                lpcwstr('Failure'),
                MB_ICONSTOP);
end;


procedure TFrm_SimpleCapture.FormCloseQuery(Sender: TObject;
                                            var CanClose: Boolean);

begin

  CanClose := False;
  // Before closing the app, clean up.
  QuitSession();
  CanClose := True;
end;


procedure TFrm_SimpleCapture.FormCreate(Sender: TObject);
var
  hr: HRESULT;

begin

  iSelectedDevice := -1;
  FCaptureDevices := TMfCaptureDevices.Create();
  bAppIsClosing := False;
  bFullScreenMode := False;
  // Get the capture engine.
  hr := GetFmCapture();
  if FAILED(hr) then
    begin
      MessageBoxW(0,
                  lpcwstr('Initialization failed with error code: ' + IntToStr(hr) + ''),
                  lpcwstr('Initialization Failure!'),
                  MB_ICONSTOP);
      // Nothing to do, terminate the app.
      Application.Terminate();
    end;
end;


procedure TFrm_SimpleCapture.FormDestroy(Sender: TObject);

begin

  QuitSession();
  SetLength(FDevicePropertiesArray,
            0);
  FreeAndNil(FCaptureDevices);
end;


procedure TFrm_SimpleCapture.FormPaint(Sender: TObject);

begin

  // LCL owns BeginPaint/EndPaint for its OnPaint notification.
  if Assigned(MfDeviceCapture) and MfDeviceCapture.VideoDetected() then
    MfDeviceCapture.UpdateVideo();
end;


// Create the capture engine.
function TFrm_SimpleCapture.GetFmCapture(): HRESULT;
var
  hr: HRESULT;

begin

  // Quit previous session.
  if Assigned(MfDeviceCapture) then
    QuitSession();

  // We want the video to be played on the VideoPanel, so, we use that handle.
  hr := TMfCaptureEngine.CreateInstance(pnlVideo.Handle,   // The clipping window / control.
                                        Handle,  // The handle of the form that handle messages,
                                        MfDeviceCapture);          // must be main form or parent window !!!
  if FAILED(hr) then
    Exit(hr);

  // If you want to switch to a different clipping surface while the session is active:
  // MfDeviceCapture.SetVideoSurface := myFormOrControl.Handle;

  Result := hr;
end;


function TFrm_SimpleCapture.SetCameraProperties(pIndex: Integer): HRESULT;

begin

  Result := S_OK;

  if not Assigned(MfDeviceCapture) then
    Exit(E_POINTER);

  cbxCameraValues.Clear;
  cbxCameraValues.Items.Append('X'); // Not supported.
  cbxCameraValues.ItemIndex := 0;
  cbxCameraValues.Enabled := False;
  cbxCameraControlFlags.Enabled := False;
  if not MfDeviceCapture.CameraProperties.IsSupported then
    Exit;

  {
   In this order:
   Pan      = 0
   Tilt     = 1
   Roll     = 2
   Zoom     = 3
   Exposure = 4
   Iris     = 5
   Focus    = 6
  }

  case pIndex of
    0: begin

         if MfDeviceCapture.CameraProperties.CameraCtl_Pan.IsSupported then
           begin

             SetCbxValues(cbxCameraValues,
                          pIndex,
                          MfDeviceCapture.CameraProperties.CameraCtl_Pan.prMax,
                          MfDeviceCapture.CameraProperties.CameraCtl_Pan.prMin,
                          MfDeviceCapture.CameraProperties.CameraCtl_Pan.prDelta,
                          MfDeviceCapture.CameraProperties.CameraCtl_Pan.prDefault,
                          MfDeviceCapture.CameraProperties.CameraCtl_Pan.prflags,
                          LONG(CameraControl_Pan));
           end;
       end;

    1: begin

         if MfDeviceCapture.CameraProperties.CameraCtl_Tilt.IsSupported then
           begin

             SetCbxValues(cbxCameraValues,
                          pIndex,
                          MfDeviceCapture.CameraProperties.CameraCtl_Tilt.prMax,
                          MfDeviceCapture.CameraProperties.CameraCtl_Tilt.prMin,
                          MfDeviceCapture.CameraProperties.CameraCtl_Tilt.prDelta,
                          MfDeviceCapture.CameraProperties.CameraCtl_Tilt.prDefault,
                          MfDeviceCapture.CameraProperties.CameraCtl_Tilt.prflags,
                          LONG(CameraControl_Tilt));
           end;
       end;

    2: begin

         if MfDeviceCapture.CameraProperties.CameraCtl_Roll.IsSupported then
           begin

             SetCbxValues(cbxCameraValues,
                          pIndex,
                          MfDeviceCapture.CameraProperties.CameraCtl_Roll.prMax,
                          MfDeviceCapture.CameraProperties.CameraCtl_Roll.prMin,
                          MfDeviceCapture.CameraProperties.CameraCtl_Roll.prDelta,
                          MfDeviceCapture.CameraProperties.CameraCtl_Roll.prDefault,
                          MfDeviceCapture.CameraProperties.CameraCtl_Roll.prflags,
                          LONG(CameraControl_Roll));
           end;
       end;

    3: begin

         if MfDeviceCapture.CameraProperties.CameraCtl_Zoom.IsSupported then
           begin

             SetCbxValues(cbxCameraValues,
                          pIndex,
                          MfDeviceCapture.CameraProperties.CameraCtl_Zoom.prMax,
                          MfDeviceCapture.CameraProperties.CameraCtl_Zoom.prMin,
                          MfDeviceCapture.CameraProperties.CameraCtl_Zoom.prDelta,
                          MfDeviceCapture.CameraProperties.CameraCtl_Zoom.prDefault,
                          MfDeviceCapture.CameraProperties.CameraCtl_Zoom.prflags,
                          LONG(CameraControl_Zoom));
           end;
       end;

    4: begin

         if MfDeviceCapture.CameraProperties.CameraCtl_Exposure.IsSupported then
           begin
             SetCbxValues(cbxCameraValues,
                          pIndex,
                          MfDeviceCapture.CameraProperties.CameraCtl_Exposure.prMax,
                          MfDeviceCapture.CameraProperties.CameraCtl_Exposure.prMin,
                          MfDeviceCapture.CameraProperties.CameraCtl_Exposure.prDelta,
                          MfDeviceCapture.CameraProperties.CameraCtl_Exposure.prDefault,
                          MfDeviceCapture.CameraProperties.CameraCtl_Exposure.prflags,
                          LONG(CameraControl_Exposure));
           end;
       end;

    5: begin

         if MfDeviceCapture.CameraProperties.CameraCtl_Iris.IsSupported then
           begin
             SetCbxValues(cbxCameraValues,
                          pIndex,
                          MfDeviceCapture.CameraProperties.CameraCtl_Iris.prMax,
                          MfDeviceCapture.CameraProperties.CameraCtl_Iris.prMin,
                          MfDeviceCapture.CameraProperties.CameraCtl_Iris.prDelta,
                          MfDeviceCapture.CameraProperties.CameraCtl_Iris.prDefault,
                          MfDeviceCapture.CameraProperties.CameraCtl_Iris.prflags,
                          LONG(CameraControl_Iris));
           end;
       end;

    6: begin

         if MfDeviceCapture.CameraProperties.CameraCtl_Focus.IsSupported then
           begin

             SetCbxValues(cbxCameraValues,
                          pIndex,
                          MfDeviceCapture.CameraProperties.CameraCtl_Focus.prMax,
                          MfDeviceCapture.CameraProperties.CameraCtl_Focus.prMin,
                          MfDeviceCapture.CameraProperties.CameraCtl_Focus.prDelta,
                          MfDeviceCapture.CameraProperties.CameraCtl_Focus.prDefault,
                          MfDeviceCapture.CameraProperties.CameraCtl_Focus.prflags,
                          LONG(CameraControl_Focus));
           end;
       end;
  end;
end;


function TFrm_SimpleCapture.SetVideoProperties(pIndex: Integer): HRESULT;

begin

  Result := S_OK;

  if not Assigned(MfDeviceCapture) then
    Exit(E_POINTER);

  cbxVideoValues.Clear;
  cbxVideoValues.Items.Append('X');  // Not supported.
  cbxVideoValues.ItemIndex := 0;
  cbxVideoValues.Enabled := False;
  cbxVideoControlFlags.Enabled := False;
  if not MfDeviceCapture.VideoProperties.IsSupported then
    Exit;
  {
   In this order:
   Brightness = 0
   Contrast   = 1
   Hue        = 2
   Saturation = 3
   Sharpness  = 4
   Gamma      = 5
   ColorEnable = 6
   WhiteBalance = 7
   BacklightCompensation = 8
   Gain = 9
  }

  case pIndex of
    0: begin
         if MfDeviceCapture.VideoProperties.VideoCtl_Brightness.IsSupported then
           begin

             SetCbxValues(cbxVideoValues,
                          pIndex,
                          MfDeviceCapture.VideoProperties.VideoCtl_Brightness.prMax,
                          MfDeviceCapture.VideoProperties.VideoCtl_Brightness.prMin,
                          MfDeviceCapture.VideoProperties.VideoCtl_Brightness.prDelta,
                          MfDeviceCapture.VideoProperties.VideoCtl_Brightness.prDefault,
                          MfDeviceCapture.VideoProperties.VideoCtl_Brightness.prflags,
                          LONG(VideoProcAmp_Brightness));
           end;
       end;
    1: begin
         if MfDeviceCapture.VideoProperties.VideoCtl_Contrast.IsSupported then
           begin

             SetCbxValues(cbxVideoValues,
                          pIndex,
                          MfDeviceCapture.VideoProperties.VideoCtl_Contrast.prMax,
                          MfDeviceCapture.VideoProperties.VideoCtl_Contrast.prMin,
                          MfDeviceCapture.VideoProperties.VideoCtl_Contrast.prDelta,
                          MfDeviceCapture.VideoProperties.VideoCtl_Contrast.prDefault,
                          MfDeviceCapture.VideoProperties.VideoCtl_Contrast.prflags,
                          LONG(VideoProcAmp_Contrast));
           end;
       end;
    2: begin
         if MfDeviceCapture.VideoProperties.VideoCtl_Hue.IsSupported then
           begin

             SetCbxValues(cbxVideoValues,
                          pIndex,
                          MfDeviceCapture.VideoProperties.VideoCtl_Hue.prMax,
                          MfDeviceCapture.VideoProperties.VideoCtl_Hue.prMin,
                          MfDeviceCapture.VideoProperties.VideoCtl_Hue.prDelta,
                          MfDeviceCapture.VideoProperties.VideoCtl_Hue.prDefault,
                          MfDeviceCapture.VideoProperties.VideoCtl_Hue.prflags,
                          LONG(VideoProcAmp_Hue));
           end;
       end;
    3: begin
         if MfDeviceCapture.VideoProperties.VideoCtl_Saturation.IsSupported then
           begin

             SetCbxValues(cbxVideoValues,
                          pIndex,
                          MfDeviceCapture.VideoProperties.VideoCtl_Saturation.prMax,
                          MfDeviceCapture.VideoProperties.VideoCtl_Saturation.prMin,
                          MfDeviceCapture.VideoProperties.VideoCtl_Saturation.prDelta,
                          MfDeviceCapture.VideoProperties.VideoCtl_Saturation.prDefault,
                          MfDeviceCapture.VideoProperties.VideoCtl_Saturation.prflags,
                          LONG(VideoProcAmp_Saturation));
           end;
       end;
    4: begin
         if MfDeviceCapture.VideoProperties.VideoCtl_Sharpness.IsSupported then
           begin

             SetCbxValues(cbxVideoValues,
                          pIndex,
                          MfDeviceCapture.VideoProperties.VideoCtl_Sharpness.prMax,
                          MfDeviceCapture.VideoProperties.VideoCtl_Sharpness.prMin,
                          MfDeviceCapture.VideoProperties.VideoCtl_Sharpness.prDelta,
                          MfDeviceCapture.VideoProperties.VideoCtl_Sharpness.prDefault,
                          MfDeviceCapture.VideoProperties.VideoCtl_Sharpness.prflags,
                          LONG(VideoProcAmp_Sharpness));
           end;
       end;
    5: begin
         if MfDeviceCapture.VideoProperties.VideoCtl_Gamma.IsSupported then
           begin

             SetCbxValues(cbxVideoValues,
                          pIndex,
                          MfDeviceCapture.VideoProperties.VideoCtl_Gamma.prMax,
                          MfDeviceCapture.VideoProperties.VideoCtl_Gamma.prMin,
                          MfDeviceCapture.VideoProperties.VideoCtl_Gamma.prDelta,
                          MfDeviceCapture.VideoProperties.VideoCtl_Gamma.prDefault,
                          MfDeviceCapture.VideoProperties.VideoCtl_Gamma.prflags,
                          LONG(VideoProcAmp_Gamma));
           end;
       end;
    6: begin
         if MfDeviceCapture.VideoProperties.VideoCtl_ColorEnable.IsSupported then
           begin

             SetCbxValues(cbxVideoValues,
                          pIndex,
                          MfDeviceCapture.VideoProperties.VideoCtl_ColorEnable.prMax,
                          MfDeviceCapture.VideoProperties.VideoCtl_ColorEnable.prMin,
                          MfDeviceCapture.VideoProperties.VideoCtl_ColorEnable.prDelta,
                          MfDeviceCapture.VideoProperties.VideoCtl_ColorEnable.prDefault,
                          MfDeviceCapture.VideoProperties.VideoCtl_ColorEnable.prflags,
                          LONG(VideoProcAmp_ColorEnable));
           end;
       end;
    7: begin
         if MfDeviceCapture.VideoProperties.VideoCtl_WhiteBalance.IsSupported then
           begin

             SetCbxValues(cbxVideoValues,
                          pIndex,
                          MfDeviceCapture.VideoProperties.VideoCtl_WhiteBalance.prMax,
                          MfDeviceCapture.VideoProperties.VideoCtl_WhiteBalance.prMin,
                          MfDeviceCapture.VideoProperties.VideoCtl_WhiteBalance.prDelta,
                          MfDeviceCapture.VideoProperties.VideoCtl_WhiteBalance.prDefault,
                          MfDeviceCapture.VideoProperties.VideoCtl_WhiteBalance.prflags,
                          LONG(VideoProcAmp_WhiteBalance));
           end;
       end;
    8: begin
         if MfDeviceCapture.VideoProperties.VideoCtl_BacklightCompensation.IsSupported then
           begin

             SetCbxValues(cbxVideoValues,
                          pIndex,
                          MfDeviceCapture.VideoProperties.VideoCtl_BacklightCompensation.prMax,
                          MfDeviceCapture.VideoProperties.VideoCtl_BacklightCompensation.prMin,
                          MfDeviceCapture.VideoProperties.VideoCtl_BacklightCompensation.prDelta,
                          MfDeviceCapture.VideoProperties.VideoCtl_BacklightCompensation.prDefault,
                          MfDeviceCapture.VideoProperties.VideoCtl_BacklightCompensation.prflags,
                          LONG(VideoProcAmp_BacklightCompensation));
           end;
       end;
    9: begin
         if MfDeviceCapture.VideoProperties.VideoCtl_Gain.IsSupported then
           begin

             SetCbxValues(cbxVideoValues,
                          pIndex,
                          MfDeviceCapture.VideoProperties.VideoCtl_Gain.prMax,
                          MfDeviceCapture.VideoProperties.VideoCtl_Gain.prMin,
                          MfDeviceCapture.VideoProperties.VideoCtl_Gain.prDelta,
                          MfDeviceCapture.VideoProperties.VideoCtl_Gain.prDefault,
                          MfDeviceCapture.VideoProperties.VideoCtl_Gain.prflags,
                          LONG(VideoProcAmp_Gain));
           end;
       end;
  end;
end;


procedure TFrm_SimpleCapture.HandleRotationChanged(Sender: TObject);

begin

  if not Assigned(MfDeviceCapture) then
    Exit;
  if (iSelectedDevice < 0) or (iSelectedDevice >= Length(FDevicePropertiesArray)) then
    Exit;
  QuitSession();
  if SUCCEEDED(GetFmCapture()) then
    begin
      MfDeviceCapture.Rotation := cboRotation.ItemIndex * 90;
      if SUCCEEDED(MfDeviceCapture.SetDevice(FDevicePropertiesArray[iSelectedDevice])) then
        begin
          SetCameraProperties(cbxCameraControlProperty.ItemIndex);
          SetVideoProperties(cbxVideoControlProperty.ItemIndex);
        end;
    end;
end;


// Message listener.
// Listen for WM_DEVICECHANGE messages. The lParam message parameter is a pointer to a DEV_BROADCAST_HDR structure.
procedure TFrm_SimpleCapture.WMDeviceChange(var Msg: TMessage);
var
  hr: HResult;

begin

  hr := S_OK;

  if not Assigned(MfDeviceCapture) then
    Exit;

  if (Msg.lParam <> 0) then
    hr := MfDeviceCapture.CheckCaptureDeviceLost(PDEV_BROADCAST_HDR(Msg.LParam),
                                                 bDeviceLost);

  if (Failed(hr) or bDeviceLost) then
    begin
      QuitSession();
      // Show dialog with info about which device is disconnected.
      MessageDlg(Format('Lost capture device %s.',
                        [FSelectedDeviceName]),
                 mtError,
                 mbOKCancel,
                 0);

      // Update DevicePropertiesArray.
      SetLength(FDevicePropertiesArray,
                0);
      FCaptureDevices.Refresh();
      FDevicePropertiesArray := FCaptureDevices.Devices;
    end;
end;


procedure TFrm_SimpleCapture.pnlVideoResize(Sender: TObject);
var
  crD: TRECT;
  pcrD: LPRECT;

begin

  // Set video size.
  if Assigned(MfDeviceCapture) then
    begin
      crD.left := 0;
      crD.top := 0;
      crD.right := pnlVideo.ClientWidth;
      crD.bottom := pnlVideo.ClientHeight;
      pcrD := @crD;
      MfDeviceCapture.ResizeVideo(pcrD);
    end;
end;


end.
