// FactoryX
//
// Copyright © FactoryX, Netherlands/Australia
//
// Project: Media Foundation - MFPack - Samples
// Project location: http://sourceforge.net/projects/MFPack
// Module: MfCaptureDevices.pas
// Kind: Pascal Unit
// Release date: 21/09/2024
// Language: ENU
//
// Revision Version: 4.1.0
//
// Description: Sample 2 camera enumeration with owned activation and metadata.
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

unit MfCaptureDevices;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

interface

uses
  Windows,
  WinApi.WinError,
  SysUtils,
  WinApi.ComBaseApi,
  WinApi.WinApiTypes,
  WinApi.MediaFoundationApi.MfApi,
  WinApi.MediaFoundationApi.MfIdl,
  WinApi.MediaFoundationApi.MfObjects,
  WinApi.MediaFoundationApi.MfMetLib;

type

  TMfCaptureDevices = class

  private
    FDevices: TDevicePropertiesArray;
    FNames: TArray<string>;
    FLinks: TArray<string>;

  public
    destructor Destroy(); override;
    procedure Clear();
    function Refresh(): HRESULT;
    property Devices: TDevicePropertiesArray read FDevices;
  end;

implementation


destructor TMfCaptureDevices.Destroy();

begin

  Clear();
  inherited;
end;


procedure TMfCaptureDevices.Clear();

begin

  // Release activation interfaces before their borrowed string pointers.
  SetLength(FDevices,
            0);
  SetLength(FNames,
            0);
  SetLength(FLinks,
            0);
end;


function TMfCaptureDevices.Refresh(): HRESULT;
var
  Attributes: IMFAttributes;
  Activations: PIMFActivate;
  Cursor: PIMFActivate;
  Count: UINT32;
  I: Integer;
  Text: PWideChar;
  TextLength: UINT32;

begin

  Clear();
  Activations := nil;
  Count := 0;
  Result := MFCreateAttributes(Attributes,
                               1);
  if SUCCEEDED(Result) then
    Result := Attributes.SetGUID(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE,
                                 MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_GUID);
  if SUCCEEDED(Result) then
    Result := MFEnumDeviceSources(Attributes,
                                  Activations,
                                  Count);
  try
    if FAILED(Result) then
      Exit;
    SetLength(FDevices,
              Count);
    SetLength(FNames,
              Count);
    SetLength(FLinks,
              Count);
    Cursor := Activations;
    for I := 0 to Integer(Count) - 1 do
      begin
        FDevices[I].pActivate := Cursor^;
        FDevices[I].riid := MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_GUID;
        FDevices[I].iDeviceIndex := I;
        Text := nil;
        Result := Cursor^.GetAllocatedString(MF_DEVSOURCE_ATTRIBUTE_FRIENDLY_NAME,
                                             Text,
                                             TextLength);
        try
          if SUCCEEDED(Result) then
            FNames[I] := string(Text);
        finally
          CoTaskMemFree(Text);
        end;
        if FAILED(Result) then
          Exit;
        Text := nil;
        Result := Cursor^.GetAllocatedString(MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK,
                                             Text,
                                             TextLength);
        try
          if SUCCEEDED(Result) then
            FLinks[I] := string(Text);
        finally
          CoTaskMemFree(Text);
        end;
        if FAILED(Result) then
          Exit;
        FDevices[I].lpFriendlyName := PWideChar(FNames[I]);
        FDevices[I].lpDisplayName := FDevices[I].lpFriendlyName;
        FDevices[I].lpSymbolicLink := PWideChar(FLinks[I]);
        Inc(Cursor);
      end;
    // Enumerating metadata never activates a camera or creates a reader.
  finally
    Cursor := Activations;
    for I := 0 to Integer(Count) - 1 do
      begin
        Cursor^ := nil;
        Inc(Cursor);
      end;
    CoTaskMemFree(Activations);
    if FAILED(Result) then
      Clear();
  end;
end;

end.
