// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: WinApi.DirectX - DirectX
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.DirectX.DocumentTarget.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 30-04-2019
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Defines for document package target interfaces.
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX), Peter Larson (ozships)
//
//------------------------------------------------------------------------------
// CHANGE LOG
// Date       Person              Reason
// ---------- ------------------- ----------------------------------------------
// 15/11/2026 All                 Eels release  SDK 10.0.28000.2705 (Windows 11)
//------------------------------------------------------------------------------
//
// Remarks: -
//
// Related objects: -
// Related projects: MfPack FPC/Lazarus port
// Known Issues: -
//
// Compiler version: FPC 3.2.2 (Windows x64 port baseline)
// SDK version: 10.0.28000.2705
//
// Todo: -
//
//==============================================================================
// Source: DocumentTarget.h
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//==============================================================================
//
// FPC port updated: 2026-11-14
// Lazarus version: 4.8
// FPC mode: DelphiUnicode; COM interfaces; UTF-8 source.
// COM headers: MfPack WinApi.ActiveX.* and WinApi.ComBaseApi.
//
//==============================================================================
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
unit WinApi.DirectX.DocumentTarget;

{$I MfPack.Fpc.inc}


interface


uses
  
  {WinApi}
  WinApi.WinApiTypes,
  {ActiveX}
  WinApi.ActiveX.OaIdl,
  WinApi.ActiveX.ObjIdlbase;

  {$ALIGN ON}
  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}


type

//#if (NTDDI_VERSION >= NTDDI_WIN7)

  // Interface IPrintDocumentPackageTarget
  // =====================================
  // Document Target IPrintDocumentPackageTarget interface:
  // Allows user to enumerate supported package target types and create one with type ID.
  // It also supports tracking package printing progess and cancelling.
  //
  IPrintDocumentPackageTarget = interface(IUnknown)
  ['{1b8efec4-3019-4c27-964e-367202156906}']
    // SDK native virtual methods.
    function GetPackageTargetTypes(out targetCount: UINT32; out targetTypes: PGUID): HRESULT; stdcall;

    function GetPackageTarget(const guidTargetType: TGUID; const riid: TGUID; out ppvTarget: Pointer): HRESULT; stdcall;

    function Cancel(): HRESULT; stdcall;
  end;
  IID_IPrintDocumentPackageTarget = IPrintDocumentPackageTarget;


  PPrintDocumentPackageCompletion = ^PrintDocumentPackageCompletion;
  PrintDocumentPackageCompletion              = (
    PrintDocumentPackageCompletion_InProgress = 0,
    PrintDocumentPackageCompletion_Completed  = ( PrintDocumentPackageCompletion_InProgress + 1),
    PrintDocumentPackageCompletion_Canceled   = ( PrintDocumentPackageCompletion_Completed + 1),
    PrintDocumentPackageCompletion_Failed     = ( PrintDocumentPackageCompletion_Canceled + 1)
  );


  PPrintDocumentPackageStatus = ^PrintDocumentPackageStatus;
  PrintDocumentPackageStatus = record
    JobId: UINT32;
    CurrentDocument: INT32;
    CurrentPage: INT32;
    CurrentPageTotal: INT32;
    Completion: PrintDocumentPackageCompletion;
    PackageStatus: HResult;
  end;


  // Interface IPrintDocumentPackageStatusEvent
  // ==========================================
  // Com event implemented by clients, who want to listen print job progress.
  //
  IPrintDocumentPackageStatusEvent = interface(IDispatch)
  ['{ed90c8ad-5c34-4d05-a1ec-0e8a9b3ad7af}']
    // SDK native virtual methods.
    function PackageStatusUpdated(packageStatus: PPrintDocumentPackageStatus): HRESULT; stdcall;
  end;
  IID_IPrintDocumentPackageStatusEvent = IPrintDocumentPackageStatusEvent;


  // Interface IPrintDocumentPackageTargetFactory
  // ============================================
  // Document Target IPrintDocumentPackageTargetFactory interface for
  // starting your print job on IPrintDocumentPackageTarget.
  //
  IPrintDocumentPackageTargetFactory = interface(IUnknown)
  ['{d2959bf7-b31b-4a3d-9600-712eb1335ba4}']
    // SDK native virtual methods.
    function CreateDocumentPackageTargetForPrintJob(printerName: PWideChar; jobName: PWideChar; jobOutputStream: IStream; jobPrintTicketStream: IStream; out docPackageTarget: IPrintDocumentPackageTarget): HRESULT; stdcall;
  end;
  IID_IPrintDocumentPackageTargetFactory = IPrintDocumentPackageTargetFactory;


  // Interface IPrintDocumentPackageTarget2
  // ======================================
  // Allows users to see if the target printer is an Internet Printing Protocol(Ipp) Printer,
  // and returns IppPrinterDevice if the target is an Ipp Printer.
  //
  IPrintDocumentPackageTarget2 = interface(IUnknown)
  ['{c560298a-535c-48f9-866a-632540660cb4}']
    // SDK native virtual methods.
    function GetIsTargetIppPrinter(out isIppPrinter: BOOL): HRESULT; stdcall;

    function GetTargetIppPrintDevice(const riid: TGUID; out ppvTarget: Pointer): HRESULT; stdcall;
  end;
  IID_IPrintDocumentPackageTarget2 = IPrintDocumentPackageTarget2;




const
  CLSID_PrintDocumentPackageTarget: TGUID = '{4842669E-9947-46EA-8BA2-D8CCE432C2CA}';

  ID_DOCUMENTPACKAGETARGET_MSXPS   : TGUID = '{9cae40a8-ded1-41c9-a9fd-d735ef33aeda}';
  ID_DOCUMENTPACKAGETARGET_OPENXPS : TGUID = '{0056bb72-8c9c-4612-bd0f-93012a87099d}';

//#endif // (NTDDI_VERSION >= NTDDI_WIN7)


//#if (NTDDI_VERSION >= NTDDI_WINBLUE)

  ID_DOCUMENTPACKAGETARGET_OPENXPS_WITH_3D : TGUID = '{63dbd720-8b14-4577-b074-7bb11b596d28}';

//#endif // (NTDDI_VERSION >= NTDDI_WINBLUE)




  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

const
  CLSID_PrintDocumentPackageTargetFactory: TGUID = '{348EF17D-6C81-4982-92B4-EE188A43867A}';

implementation

  // Implement Additional functions here.

end.
