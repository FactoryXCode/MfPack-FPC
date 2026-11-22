// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WIC.WinCodecSdk.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 30-04-2019
// Language: ENU
//
// Upstream revision: 4.1.0
//
// Description: Used by Windows Imaging Component (WIC) API.
//              This module contains interfaces used by codec and metadata handler authors.
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
// Remarks: Requires Windows Vista or later.
//          This API contains the latest version (see sdk version).
//          FPC port uses MfPack SDK declarations; validate optional interfaces before use.
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
// Source: wincodecsdk.h
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
unit WinApi.WIC.WinCodecSdk;

{$I MfPack.Fpc.inc}

interface


uses

  {WinApi}
  Windows,
  {WIC}
  WinApi.WIC.WinCodec,
  {ActiveX}
  WinApi.ActiveX.ObjIdlBase,
  WinApi.ActiveX.ObjIdl,
  WinApi.ActiveX.OcIdl,
  WinApi.ActiveX.PropIdl;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
  {$ALIGN 8}
  // Win64
  {$ENDIF}

const

  GUID_MetadataFormatUnknown: TGUID = '{A45E592F-9078-4A7C-ADB5-4EDC4FD61B1F}';
  GUID_MetadataFormatIfd: TGUID = '{537396C6-2D8A-4BB6-9BF8-2F0A8E2A3ADF}';
  GUID_MetadataFormatSubIfd: TGUID = '{58A2E128-2DB9-4E57-BB14-5177891ED331}';
  GUID_MetadataFormatExif: TGUID = '{1C3C4F9D-B84A-467D-9493-36CFBD59EA57}';
  GUID_MetadataFormatGps: TGUID = '{7134AB8A-9351-44AD-AF62-448DB6B502EC}';
  GUID_MetadataFormatInterop: TGUID = '{ED686F8E-681F-4C8B-BD41-A8ADDBF6B3FC}';
  GUID_MetadataFormatApp0: TGUID = '{79007028-268D-45d6-A3C2-354E6A504BC9}';
  GUID_MetadataFormatApp1: TGUID = '{8FD3DFC3-F951-492B-817F-69C2E6D9A5B0}';
  GUID_MetadataFormatApp13: TGUID = '{326556A2-F502-4354-9CC0-8E3F48EAF6B5}';
  GUID_MetadataFormatIPTC: TGUID = '{4FAB0914-E129-4087-A1D1-BC812D45A7B5}';
  GUID_MetadataFormatIRB: TGUID = '{16100D66-8570-4BB9-B92D-FDA4B23ECE67}';
  GUID_MetadataFormat8BIMIPTC: TGUID = '{0010568c-0852-4e6a-b191-5c33ac5b0430}';
  GUID_MetadataFormat8BIMResolutionInfo: TGUID = '{739F305D-81DB-43CB-AC5E-55013EF9F003}';
  GUID_MetadataFormat8BIMIPTCDigest: TGUID = '{1CA32285-9CCD-4786-8BD8-79539DB6A006}';
  GUID_MetadataFormatXMP: TGUID = '{BB5ACC38-F216-4CEC-A6C5-5F6E739763A9}';
  GUID_MetadataFormatThumbnail: TGUID = '{243dcee9-8703-40ee-8ef0-22a600b8058c}';
  GUID_MetadataFormatChunktEXt: TGUID = '{568d8936-c0a9-4923-905d-df2b38238fbc}';
  GUID_MetadataFormatXMPStruct: TGUID = '{22383CF1-ED17-4E2E-AF17-D85B8F6B30D0}';
  GUID_MetadataFormatXMPBag: TGUID = '{833CCA5F-DCB7-4516-806F-6596AB26DCE4}';
  GUID_MetadataFormatXMPSeq: TGUID = '{63E8DF02-EB6C-456C-A224-B25E794FD648}';
  GUID_MetadataFormatXMPAlt: TGUID = '{7B08A675-91AA-481B-A798-4DA94908613B}';
  GUID_MetadataFormatLSD: TGUID = '{E256031E-6299-4929-B98D-5AC884AFBA92}';
  GUID_MetadataFormatIMD: TGUID = '{BD2BB086-4D52-48DD-9677-DB483E85AE8F}';
  GUID_MetadataFormatGCE: TGUID = '{2A25CAD8-DEEB-4C69-A788-0EC2266DCAFD}';
  GUID_MetadataFormatAPE: TGUID = '{2E043DC2-C967-4E05-875E-618BF67E85C3}';
  GUID_MetadataFormatJpegChrominance: TGUID = '{F73D0DCF-CEC6-4F85-9B0E-1C3956B1BEF7}';
  GUID_MetadataFormatJpegLuminance: TGUID = '{86908007-EDFC-4860-8D4B-4EE6E83E6058}';
  GUID_MetadataFormatJpegComment: TGUID = '{220E5F33-AFD3-474E-9D31-7D4FE730F557}';
  GUID_MetadataFormatGifComment: TGUID = '{C4B6E0E0-CFB4-4AD3-AB33-9AAD2355A34A}';
  GUID_MetadataFormatChunkgAMA: TGUID = '{F00935A5-1D5D-4CD1-81B2-9324D7ECA781}';
  GUID_MetadataFormatChunkbKGD: TGUID = '{E14D3571-6B47-4DEA-B60A-87CE0A78DFB7}';
  GUID_MetadataFormatChunkiTXt: TGUID = '{C2BEC729-0B68-4B77-AA0E-6295A6AC1814}';
  GUID_MetadataFormatChunkcHRM: TGUID = '{9DB3655B-2842-44B3-8067-12E9B375556A}';
  GUID_MetadataFormatChunkhIST: TGUID = '{C59A82DA-DB74-48A4-BD6A-B69C4931EF95}';
  GUID_MetadataFormatChunkiCCP: TGUID = '{EB4349AB-B685-450F-91B5-E802E892536C}';
  GUID_MetadataFormatChunksRGB: TGUID = '{C115FD36-CC6F-4E3F-8363-524B87C6B0D9}';
  GUID_MetadataFormatChunktIME: TGUID = '{6B00AE2D-E24B-460A-98B6-878BD03072FD}';
  GUID_MetadataFormatDds: TGUID = '{4a064603-8c33-4e60-9c29-136231702d08}';
  GUID_MetadataFormatHeif: TGUID = '{817EF3E1-1288-45F4-A852-260D9E7CCE83}';
  GUID_MetadataFormatHeifHDR: TGUID = '{568b8d8a-1e65-438c-8968-d60e1012beb9}';
  GUID_MetadataFormatWebpANIM: TGUID = '{6dc4fda6-78e6-4102-ae35-bcfa1edcc78b}';
  GUID_MetadataFormatWebpANMF: TGUID = '{43c105ee-b93b-4abb-b003-a08c0d870471}';
  GUID_MetadataFormatJpegXLAnim: TGUID = '{501c2e24-7a7d-42b2-93c7-b4f45bcc92f7}';
  GUID_MetadataFormatJpegXLAnimFrame: TGUID = '{958ecc2c-36cb-4af9-9ea8-0b74baccfd3e}';
  GUID_MetadataFormatGainMap: TGUID = '{568d3138-c446-4ec2-a7a8-59abb16d21e3}';

  //=========================================================================*\
  //  GUID Identifiers for the built in metadata handlers
  //=========================================================================*/

  CLSID_WICUnknownMetadataReader: TGUID = '{699745c2-5066-4b82-a8e3-d40478dbec8c}';
  CLSID_WICUnknownMetadataWriter: TGUID = '{a09cca86-27ba-4f39-9053-121fa4dc08fc}';
  CLSID_WICApp0MetadataWriter: TGUID = '{F3C633A2-46C8-498e-8FBB-CC6F721BBCDE}';
  CLSID_WICApp0MetadataReader: TGUID = '{43324B33-A78F-480f-9111-9638AACCC832}';
  CLSID_WICApp1MetadataWriter: TGUID = '{ee366069-1832-420f-b381-0479ad066f19}';
  CLSID_WICApp1MetadataReader: TGUID = '{dde33513-774e-4bcd-ae79-02f4adfe62fc}';
  CLSID_WICApp13MetadataWriter: TGUID = '{7B19A919-A9D6-49E5-BD45-02C34E4E4CD5}';
  CLSID_WICApp13MetadataReader: TGUID = '{AA7E3C50-864C-4604-BC04-8B0B76E637F6}';
  CLSID_WICIfdMetadataReader: TGUID = '{8f914656-9d0a-4eb2-9019-0bf96d8a9ee6}';
  CLSID_WICIfdMetadataWriter: TGUID = '{b1ebfc28-c9bd-47a2-8d33-b948769777a7}';
  CLSID_WICSubIfdMetadataReader: TGUID = '{50D42F09-ECD1-4B41-B65D-DA1FDAA75663}';
  CLSID_WICSubIfdMetadataWriter: TGUID = '{8ADE5386-8E9B-4F4C-ACF2-F0008706B238}';
  CLSID_WICExifMetadataReader: TGUID = '{d9403860-297f-4a49-bf9b-77898150a442}';
  CLSID_WICExifMetadataWriter: TGUID = '{c9a14cda-c339-460b-9078-d4debcfabe91}';
  CLSID_WICGpsMetadataReader: TGUID = '{3697790B-223B-484E-9925-C4869218F17A}';
  CLSID_WICGpsMetadataWriter: TGUID = '{CB8C13E4-62B5-4C96-A48B-6BA6ACE39C76}';
  CLSID_WICInteropMetadataReader: TGUID = '{B5C8B898-0074-459F-B700-860D4651EA14}';
  CLSID_WICInteropMetadataWriter: TGUID = '{122EC645-CD7E-44D8-B186-2C8C20C3B50F}';
  CLSID_WICThumbnailMetadataReader: TGUID = '{fb012959-f4f6-44d7-9d09-daa087a9db57}';
  CLSID_WICThumbnailMetadataWriter: TGUID = '{d049b20c-5dd0-44fe-b0b3-8f92c8e6d080}';
  CLSID_WICIPTCMetadataReader: TGUID = '{03012959-f4f6-44d7-9d09-daa087a9db57}';
  CLSID_WICIPTCMetadataWriter: TGUID = '{1249b20c-5dd0-44fe-b0b3-8f92c8e6d080}';
  CLSID_WICIRBMetadataReader: TGUID = '{D4DCD3D7-B4C2-47D9-A6BF-B89BA396A4A3}';
  CLSID_WICIRBMetadataWriter: TGUID = '{5C5C1935-0235-4434-80BC-251BC1EC39C6}';
  CLSID_WIC8BIMIPTCMetadataReader: TGUID = '{0010668c-0801-4da6-a4a4-826522b6d28f}';
  CLSID_WIC8BIMIPTCMetadataWriter: TGUID = '{00108226-ee41-44a2-9e9c-4be4d5b1d2cd}';
  CLSID_WIC8BIMResolutionInfoMetadataReader: TGUID = '{5805137A-E348-4F7C-B3CC-6DB9965A0599}';
  CLSID_WIC8BIMResolutionInfoMetadataWriter: TGUID = '{4ff2fe0e-e74a-4b71-98c4-ab7dc16707ba}';
  CLSID_WIC8BIMIPTCDigestMetadataReader: TGUID = '{02805F1E-D5AA-415b-82C5-61C033A988A6}';
  CLSID_WIC8BIMIPTCDigestMetadataWriter: TGUID = '{2DB5E62B-0D67-495f-8F9D-C2F0188647AC}';
  CLSID_WICPngTextMetadataReader: TGUID = '{4b59afcc-b8c3-408a-b670-89e5fab6fda7}';
  CLSID_WICPngTextMetadataWriter: TGUID = '{b5ebafb9-253e-4a72-a744-0762d2685683}';
  CLSID_WICXMPMetadataReader: TGUID = '{72B624DF-AE11-4948-A65C-351EB0829419}';
  CLSID_WICXMPMetadataWriter: TGUID = '{1765E14E-1BD4-462E-B6B1-590BF1262AC6}';
  CLSID_WICXMPStructMetadataReader: TGUID = '{01B90D9A-8209-47F7-9C52-E1244BF50CED}';
  CLSID_WICXMPStructMetadataWriter: TGUID = '{22C21F93-7DDB-411C-9B17-C5B7BD064ABC}';
  CLSID_WICXMPBagMetadataReader: TGUID = '{E7E79A30-4F2C-4FAB-8D00-394F2D6BBEBE}';
  CLSID_WICXMPBagMetadataWriter: TGUID = '{ED822C8C-D6BE-4301-A631-0E1416BAD28F}';
  CLSID_WICXMPSeqMetadataReader: TGUID = '{7F12E753-FC71-43D7-A51D-92F35977ABB5}';
  CLSID_WICXMPSeqMetadataWriter: TGUID = '{6D68D1DE-D432-4B0F-923A-091183A9BDA7}';
  CLSID_WICXMPAltMetadataReader: TGUID = '{AA94DCC2-B8B0-4898-B835-000AABD74393}';
  CLSID_WICXMPAltMetadataWriter: TGUID = '{076C2A6C-F78F-4C46-A723-3583E70876EA}';
  CLSID_WICLSDMetadataReader: TGUID = '{41070793-59E4-479A-A1F7-954ADC2EF5FC}';
  CLSID_WICLSDMetadataWriter: TGUID = '{73C037E7-E5D9-4954-876A-6DA81D6E5768}';
  CLSID_WICGCEMetadataReader: TGUID = '{B92E345D-F52D-41F3-B562-081BC772E3B9}';
  CLSID_WICGCEMetadataWriter: TGUID = '{AF95DC76-16B2-47F4-B3EA-3C31796693E7}';
  CLSID_WICIMDMetadataReader: TGUID = '{7447A267-0015-42C8-A8F1-FB3B94C68361}';
  CLSID_WICIMDMetadataWriter: TGUID = '{8C89071F-452E-4E95-9682-9D1024627172}';
  CLSID_WICAPEMetadataReader: TGUID = '{1767B93A-B021-44EA-920F-863C11F4F768}';
  CLSID_WICAPEMetadataWriter: TGUID = '{BD6EDFCA-2890-482F-B233-8D7339A1CF8D}';
  CLSID_WICJpegChrominanceMetadataReader: TGUID = '{50B1904B-F28F-4574-93F4-0BADE82C69E9}';
  CLSID_WICJpegChrominanceMetadataWriter: TGUID = '{3FF566F0-6E6B-49D4-96E6-B78886692C62}';
  CLSID_WICJpegLuminanceMetadataReader: TGUID = '{356F2F88-05A6-4728-B9A4-1BFBCE04D838}';
  CLSID_WICJpegLuminanceMetadataWriter: TGUID = '{1D583ABC-8A0E-4657-9982-A380CA58FB4B}';
  CLSID_WICJpegCommentMetadataReader: TGUID = '{9f66347C-60C4-4C4D-AB58-D2358685f607}';
  CLSID_WICJpegCommentMetadataWriter: TGUID = '{E573236F-55B1-4EDA-81EA-9F65DB0290D3}';
  CLSID_WICGifCommentMetadataReader: TGUID = '{32557D3B-69DC-4F95-836E-F5972B2F6159}';
  CLSID_WICGifCommentMetadataWriter: TGUID = '{A02797fC-C4AE-418C-AF95-E637C7EAD2A1}';
  CLSID_WICPngGamaMetadataReader: TGUID = '{3692CA39-E082-4350-9E1F-3704CB083CD5}';
  CLSID_WICPngGamaMetadataWriter: TGUID = '{FF036D13-5D4B-46DD-B10F-106693D9FE4F}';
  CLSID_WICPngBkgdMetadataReader: TGUID = '{0CE7A4A6-03E8-4A60-9D15-282EF32EE7DA}';
  CLSID_WICPngBkgdMetadataWriter: TGUID = '{68E3F2FD-31AE-4441-BB6A-FD7047525F90}';
  CLSID_WICPngItxtMetadataReader: TGUID = '{AABFB2FA-3E1E-4A8F-8977-5556FB94EA23}';
  CLSID_WICPngItxtMetadataWriter: TGUID = '{31879719-E751-4DF8-981D-68DFF67704ED}';
  CLSID_WICPngChrmMetadataReader: TGUID = '{F90B5F36-367B-402A-9DD1-BC0FD59D8F62}';
  CLSID_WICPngChrmMetadataWriter: TGUID = '{E23CE3EB-5608-4E83-BCEF-27B1987E51D7}';
  CLSID_WICPngHistMetadataReader: TGUID = '{877A0BB7-A313-4491-87B5-2E6D0594F520}';
  CLSID_WICPngHistMetadataWriter: TGUID = '{8A03E749-672E-446E-BF1F-2C11D233B6FF}';
  CLSID_WICPngIccpMetadataReader: TGUID = '{F5D3E63B-CB0F-4628-A478-6D8244BE36B1}';
  CLSID_WICPngIccpMetadataWriter: TGUID = '{16671E5F-0CE6-4CC4-9768-E89FE5018ADE}';
  CLSID_WICPngSrgbMetadataReader: TGUID = '{FB40360C-547E-4956-A3B9-D4418859BA66}';
  CLSID_WICPngSrgbMetadataWriter: TGUID = '{A6EE35C6-87EC-47DF-9F22-1D5AAD840C82}';
  CLSID_WICPngTimeMetadataReader: TGUID = '{D94EDF02-EFE5-4F0D-85C8-F5A68B3000B1}';
  CLSID_WICPngTimeMetadataWriter: TGUID = '{1AB78400-B5A3-4D91-8ACE-33FCD1499BE6}';
  CLSID_WICDdsMetadataReader: TGUID = '{276c88ca-7533-4a86-b676-66b36080d484}';
  CLSID_WICDdsMetadataWriter: TGUID = '{fd688bbd-31ed-4db7-a723-934927d38367}';
  CLSID_WICHeifMetadataReader: TGUID = '{ACDDFC3F-85EC-41BC-BDEF-1BC262E4DB05}';
  CLSID_WICHeifMetadataWriter: TGUID = '{3AE45E79-40BC-4401-ACE5-DD3CB16E6AFE}';
  CLSID_WICHeifHDRMetadataReader: TGUID = '{2438de3d-94d9-4be8-84a8-4de95a575e75}';
  CLSID_WICWebpAnimMetadataReader: TGUID = '{076f9911-a348-465c-a807-a252f3f2d3de}';
  CLSID_WICWebpAnmfMetadataReader: TGUID = '{85a10b03-c9f6-439f-be5e-c0fbef67807c}';
  CLSID_WICJpegXLAnimFrameMetadataWriter: TGUID = '{d1ce58a8-06e0-4b6f-8fc1-577560bd5ad9}';
  CLSID_WICGainMapMetadataReader: TGUID = '{3ac32daf-27b9-4af5-b0ab-d1189dcf34b3}';
  CLSID_WICGainMapMetadataWriter: TGUID = '{6f845268-a92e-4a02-b002-a67c362800b2}';


  // Enums =======================================================================

type
  PULARGE_INTEGER = ^ULARGE_INTEGER;
  PWICMetadataCreationOptions = ^WICMetadataCreationOptions;
  WICMetadataCreationOptions = DWord;

const
  WICMetadataCreationDefault = WICMetadataCreationOptions(0);
  WICMetadataCreationAllowUnknown = WICMetadataCreationDefault;
  WICMetadataCreationFailUnknown = WICMetadataCreationOptions($10000);
  WICMetadataCreationMask = WICMetadataCreationOptions($FFFF0000);

type
  PWICPersistOptions = ^WICPersistOptions;
  WICPersistOptions = DWord;

const
  WICPersistOptionDefault = WICPersistOptions(0);
  WICPersistOptionLittleEndian = WICPersistOptions(0);
  WICPersistOptionBigEndian = WICPersistOptions($1);
  WICPersistOptionStrictFormat = WICPersistOptions($2);
  WICPersistOptionNoCacheStream = WICPersistOptions($4);
  WICPersistOptionPreferUTF8 = WICPersistOptions($8);
  WICPersistOptionMask = WICPersistOptions($FFFF);

  // =============================================================================
type

  //* Forward Declarations *//

  PIWICMetadataReader = ^IWICMetadataReader;
  IWICMetadataReader = interface;

  PIWICMetadataWriter = ^IWICMetadataWriter;
  IWICMetadataWriter = interface;

  PIWICMetadataHandlerInfo = ^IWICMetadataHandlerInfo;
  IWICMetadataHandlerInfo = interface;



  // Interface IWICMetadataBlockReader
  // =================================
  //
  IWICMetadataBlockReader = interface(IUnknown)
    ['{FEAA2A8D-B3F3-43E4-B25C-D1DE990A1AE1}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetContainerFormat(pguidContainerFormat: PGUID): HRESULT; stdcall;

    function GetCount(pcCount: PUINT): HRESULT; stdcall;

    function GetReaderByIndex(nIndex: UINT;
                              out ppIMetadataReader: IWICMetadataReader): HRESULT; stdcall;

    function GetEnumerator(out ppIEnumMetadata: IEnumUnknown): HRESULT; stdcall;
  end;

  IID_IWICMetadataBlockReader = IWICMetadataBlockReader;


  // Interface IWICMetadataBlockWriter
  // =================================
  //
  IWICMetadataBlockWriter = interface(IWICMetadataBlockReader)
    ['{08FB9676-B444-41E8-8DBE-6A53A542BFF1}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function InitializeFromBlockReader(pIMDBlockReader: IWICMetadataBlockReader): HRESULT; stdcall;

    function GetWriterByIndex(nIndex: UINT;
                              out ppIMetadataWriter: IWICMetadataWriter): HRESULT; stdcall;

    function AddWriter(pIMetadataWriter: IWICMetadataWriter): HRESULT; stdcall;

    function SetWriterByIndex(nIndex: UINT;
                              pIMetadataWriter: IWICMetadataWriter): HRESULT; stdcall;

    function RemoveWriterByIndex(nIndex: UINT): HRESULT; stdcall;
  end;

  IID_IWICMetadataBlockWriter = IWICMetadataBlockWriter;


  // Interface IWICMetadataReader
  // ============================
  //
  IWICMetadataReader = interface(IUnknown)
    ['{9204FE99-D8FC-4FD5-A001-9536B067A899}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetMetadataFormat(pguidMetadataFormat: PGUID): HRESULT; stdcall;

    function GetMetadataHandlerInfo(out ppIHandler: IWICMetadataHandlerInfo): HRESULT; stdcall;

    function GetCount(pcCount: PUINT): HRESULT; stdcall;

    function GetValueByIndex(nIndex: UINT;
                             pvarSchema: PPROPVARIANT;
                             pvarId: PPROPVARIANT;
                             pvarValue: PPROPVARIANT): HRESULT; stdcall;

    function GetValue(pvarSchema: PPROPVARIANT;
                      pvarId: PPROPVARIANT;
                      pvarValue: PPROPVARIANT): HRESULT; stdcall;

    function GetEnumerator(out ppIEnumMetadata: IWICEnumMetadataItem): HRESULT; stdcall;
  end;

  IID_IWICMetadataReader = IWICMetadataReader;



  // Interface IWICMetadataWriter
  // ============================
  //
  IWICMetadataWriter = interface(IWICMetadataReader)
    ['{F7836E16-3BE0-470B-86BB-160D0AECD7DE}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function SetValue(pvarSchema: PPROPVARIANT;
                      pvarId: PPROPVARIANT;
                      pvarValue: PPROPVARIANT): HRESULT; stdcall;

    function SetValueByIndex(nIndex: UINT;
                             pvarSchema: PPROPVARIANT;
                             pvarId: PPROPVARIANT;
                             pvarValue: PPROPVARIANT): HRESULT; stdcall;

    function RemoveValue(pvarSchema: PPROPVARIANT;
                         pvarId: PPROPVARIANT): HRESULT; stdcall;

    function RemoveValueByIndex(nIndex: UINT): HRESULT; stdcall;
  end;

  IID_IWICMetadataWriter = IWICMetadataWriter;



  // Interface IWICStreamProvider
  // ============================
  //
  IWICStreamProvider = interface(IUnknown)
    ['{449494BC-B468-4927-96D7-BA90D31AB505}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetStream(out ppIStream: IStream): HRESULT; stdcall;

    function GetPersistOptions(pdwPersistOptions: PDWORD): HRESULT; stdcall;

    function GetPreferredVendorGUID(pguidPreferredVendor: PGUID): HRESULT; stdcall;

    function RefreshStream(): HRESULT; stdcall;
  end;

  IID_IWICStreamProvider = IWICStreamProvider;



  // Interface IWICPersistStream
  // ===========================
  //
  IWICPersistStream = interface(IPersistStream)
    ['{00675040-6908-45F8-86A3-49C7DFD6D9AD}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function LoadEx(pIStream: IStream;
                    pguidPreferredVendor: PGUID;
                    dwPersistOptions: DWORD): HRESULT; stdcall;

    function SaveEx(pIStream: IStream;
                    dwPersistOptions: DWORD;
                    fClearDirty: BOOL): HRESULT; stdcall;
  end;

  IID_IWICPersistStream = IWICPersistStream;


  // Interface IWICMetadataHandlerInfo
  // =================================
  //
  IWICMetadataHandlerInfo = interface(IWICComponentInfo)
    ['{ABA958BF-C672-44D1-8D61-CE6DF2E682C2}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetMetadataFormat(pguidMetadataFormat: PGUID): HRESULT; stdcall;

    function GetContainerFormats(cContainerFormats: UINT;
                                 pguidContainerFormats: PGUID;
                                 pcchActual: PUINT): HRESULT; stdcall;

    function GetDeviceManufacturer(cchDeviceManufacturer: UINT;
                                   wzDeviceManufacturer: PWideChar;
                                   pcchActual: PUINT): HRESULT; stdcall;

    function GetDeviceModels(cchDeviceModels: UINT;
                             wzDeviceModels: PWideChar;
                             pcchActual: PUINT): HRESULT; stdcall;

    function DoesRequireFullStream(pfRequiresFullStream: PBOOL): HRESULT; stdcall;

    function DoesSupportPadding(pfSupportsPadding: PBOOL): HRESULT; stdcall;

    function DoesRequireFixedSize(pfFixedSize: PBOOL): HRESULT; stdcall;
  end;

  IID_IWICMetadataHandlerInfo = IWICMetadataHandlerInfo;


  PWICMetadataPattern = ^WICMetadataPattern;

  WICMetadataPattern = record
    Position: ULARGE_INTEGER;
    Length: ULONG;
    Pattern: PByte;
    Mask: PByte;
    DataOffset: ULARGE_INTEGER;
  end;


  // Interface IWICMetadataReaderInfo
  // ================================
  //
  IWICMetadataReaderInfo = interface(IWICMetadataHandlerInfo)
    ['{EEBF1F5B-07C1-4447-A3AB-22ACAF78A804}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetPatterns(const guidContainerFormat: TGUID;
                         cbSize: UINT;
                         pPattern: PWICMetadataPattern;
                         pcCount: PUINT;
                         pcbActual: PUINT): HRESULT; stdcall;

    function MatchesPattern(const guidContainerFormat: TGUID;
                            pIStream: IStream;
                            pfMatches: PBOOL): HRESULT; stdcall;

    function CreateInstance(out ppIReader: IWICMetadataReader): HRESULT; stdcall;
  end;

  IID_IWICMetadataReaderInfo = IWICMetadataReaderInfo;



  PWICMetadataHeader = ^WICMetadataHeader;

  WICMetadataHeader = record
    Position: ULARGE_INTEGER;
    Length: ULONG;
    Header: PByte;
    DataOffset: ULARGE_INTEGER;
  end;


  // Interface IWICMetadataWriterInfo
  // ================================
  //
  IWICMetadataWriterInfo = interface(IWICMetadataHandlerInfo)
    ['{B22E3FBA-3925-4323-B5C1-9EBFC430F236}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetHeader(const guidContainerFormat: TGUID;
                       cbSize: UINT;
                       pHeader: PWICMetadataHeader;
                       pcbActual: PUINT): HRESULT; stdcall;

    function CreateInstance(out ppIWriter: IWICMetadataWriter): HRESULT; stdcall;
  end;

  IID_IWICMetadataWriterInfo = IWICMetadataWriterInfo;


  // Interface IWICComponentFactory
  // ==============================
  //
  IWICComponentFactory = interface(IWICImagingFactory)
    ['{412D0C3A-9650-44FA-AF5B-DD2A06C8E8FB}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function CreateMetadataReader(const guidMetadataFormat: TGUID;
                                  pguidVendor: PGUID;
                                  dwOptions: DWORD;
                                  pIStream: IStream;
                                  out ppIReader: IWICMetadataReader): HRESULT; stdcall;

    function CreateMetadataReaderFromContainer(const guidContainerFormat: TGUID;
                                               pguidVendor: PGUID;
                                               dwOptions: DWORD;
                                               pIStream: IStream;
                                               out ppIReader: IWICMetadataReader): HRESULT; stdcall;

    function CreateMetadataWriter(const guidMetadataFormat: TGUID;
                                  pguidVendor: PGUID;
                                  dwMetadataOptions: DWORD;
                                  out ppIWriter: IWICMetadataWriter): HRESULT; stdcall;

    function CreateMetadataWriterFromReader(pIReader: IWICMetadataReader;
                                            pguidVendor: PGUID;
                                            out ppIWriter: IWICMetadataWriter): HRESULT; stdcall;

    function CreateQueryReaderFromBlockReader(pIBlockReader: IWICMetadataBlockReader;
                                              out ppIQueryReader: IWICMetadataQueryReader): HRESULT; stdcall;

    function CreateQueryWriterFromBlockWriter(pIBlockWriter: IWICMetadataBlockWriter;
                                              out ppIQueryWriter: IWICMetadataQueryWriter): HRESULT; stdcall;

    function CreateEncoderPropertyBag(ppropOptions: PPROPBAG2;
                                      cCount: UINT;
                                      out ppIPropertyBag: IPropertyBag2): HRESULT; stdcall;
  end;

  IID_IWICComponentFactory = IWICComponentFactory;



function WICMatchMetadataContent(const guidContainerFormat: TGUID;
                                 pguidVendor: PGUID;
                                 pIStream: IStream;
                                 pguidMetadataFormat: PGUID): HRESULT; stdcall;

function WICSerializeMetadataContent(const guidContainerFormat: TGUID;
                                     pIWriter: IWICMetadataWriter;
                                     dwPersistOptions: DWORD;
                                     pIStream: IStream): HRESULT; stdcall;

function WICGetMetadataContentSize(const guidContainerFormat: TGUID;
                                   pIWriter: IWICMetadataWriter;
                                   pcbSize: PULARGE_INTEGER): HRESULT; stdcall;


//* Additional Prototypes for ALL interfaces *//


//* end of Additional Prototypes *//


implementation

const
  WinCodecLib = 'Windowscodecs.dll';


function WICMatchMetadataContent; external WinCodecLib name 'WICMatchMetadataContent';
function WICSerializeMetadataContent; external WinCodecLib name 'WICSerializeMetadataContent';
function WICGetMetadataContentSize; external WinCodecLib name 'WICGetMetadataContentSize';


//Implement Additional functions here.

end.
