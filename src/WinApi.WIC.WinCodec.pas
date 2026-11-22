// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WIC.WinCodec.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 30-04-2019
// Language: ENU
//
// Upstream revision: 4.1.0
//
// Description: Windows Imaging Component (WIC) API.
//              This module contains the public data structures and API definitions
//              needed for the Windows still image codecs.
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
//          This API contains the latest version (see SDK version).
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
// Source: wincodec.h
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
unit WinApi.WIC.WinCodec;

{$I MfPack.Fpc.inc}


interface


uses

  {WinApi}
  Windows,
  WinApi.WinError,
  WinApi.WinApiTypes,
  {ActiveX}
  WinApi.ActiveX.PropIdl,
  WinApi.ActiveX.ObjIdlBase,
  WinApi.ActiveX.OcIdl,
  {DirectX}
  WinApi.DirectX.DXGIFormat,
  WinApi.DirectX.DXGIType,
  WinApi.DirectX.DCommon;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
  {$ALIGN 8}
  // Win64
  {$ENDIF}


const

  WINCODEC_SDK_VERSION1 = $0236;

  WINCODEC_SDK_VERSION2 = $0237;

  CLSID_WICImagingFactory1: TGUID = '{cacaf262-9370-4615-a13b-9f5539da4c0a}';
  CLSID_WICImagingFactory2: TGUID = '{317d06e8-5f24-433d-bdf7-79ce68d8abc2}';

  //#if(_WIN32_WINNT >= _WIN32_WINNT_WIN8) or defined(_WIN7_PLATFORM_UPDATE)
  WINCODEC_SDK_VERSION = WINCODEC_SDK_VERSION2;

var
  CLSID_WICImagingFactory: TGUID absolute CLSID_WICImagingFactory2;
  //#else
  // const WINCODEC_SDK_VERSION                = WINCODEC_SDK_VERSION1;
  //#endif



const

  //*=========================================================================*\
  //  GUID Identifiers for the vendors
  //*=========================================================================*/

  GUID_VendorMicrosoft: TGUID = '{f0e749ca-edef-4589-a73a-ee0e626a2a2b}';
  GUID_VendorMicrosoftBuiltIn: TGUID = '{257a30fd-06b6-462b-aea4-63f70b86e533}';


  //*=========================================================================*\
  //  GUID Identifiers for the codecs
  //*=========================================================================*/

  CLSID_WICPngDecoder1: TGUID = '{389ea17b-5078-4cde-b6ef-25c15175c751}';
  CLSID_WICPngDecoder2: TGUID = '{e018945b-aa86-4008-9bd4-6777a1e40c11}';

  //#if(_WIN32_WINNT >= _WIN32_WINNT_WIN8) or defined(_WIN7_PLATFORM_UPDATE)
var
  CLSID_WICPngDecoder: TGUID absolute CLSID_WICPngDecoder2;
  //#endif

const

  CLSID_WICBmpDecoder: TGUID = '{6b462062-7cbf-400d-9fdb-813dd10f2778}';
  CLSID_WICIcoDecoder: TGUID = '{c61bfcdf-2e0f-4aad-a8d7-e06bafebcdfe}';
  CLSID_WICJpegDecoder: TGUID = '{9456a480-e88b-43ea-9e73-0b2d9b71b1ca}';
  CLSID_WICGifDecoder: TGUID = '{381dda3c-9ce9-4834-a23e-1f98f8fc52be}';
  CLSID_WICTiffDecoder: TGUID = '{b54e85d9-fe23-499f-8b88-6acea713752b}';
  CLSID_WICWmpDecoder: TGUID = '{a26cec36-234c-4950-ae16-e34aace71d0d}';
  CLSID_WICDdsDecoder: TGUID = '{9053699f-a341-429d-9e90-ee437cf80c73}';
  CLSID_WICBmpEncoder: TGUID = '{69be8bb4-d66d-47c8-865a-ed1589433782}';
  CLSID_WICPngEncoder: TGUID = '{27949969-876a-41d7-9447-568f6a35a4dc}';
  CLSID_WICJpegEncoder: TGUID = '{1a34f5c1-4a5a-46dc-b644-1f4567e7a676}';
  CLSID_WICGifEncoder: TGUID = '{114f5598-0b22-40a0-86a1-c83ea495adbd}';
  CLSID_WICTiffEncoder: TGUID = '{0131be10-2001-4c5f-a9b0-cc88fab64ce8}';
  CLSID_WICWmpEncoder: TGUID = '{ac4ce3cb-e1c1-44cd-8215-5a1665509ec2}';
  CLSID_WICDdsEncoder: TGUID = '{a61dde94-66ce-4ac1-881b-71680588895e}';
  CLSID_WICAdngDecoder: TGUID = '{981d9411-909e-42a7-8f5d-a747ff052edb}';
  CLSID_WICJpegQualcommPhoneEncoder: TGUID = '{68ed5c62-f534-4979-b2b3-686a12b2b34c}';
  CLSID_WICHeifDecoder: TGUID = '{e9A4A80a-44fe-4DE4-8971-7150B10a5199}';
  CLSID_WICHeifEncoder: TGUID = '{0dbecec1-9eb3-4860-9c6f-ddbe86634575}';
  CLSID_WICWebpDecoder: TGUID = '{7693E886-51C9-4070-8419-9F70738EC8FA}';
  CLSID_WICRAWDecoder: TGUID = '{41945702-8302-44A6-9445-AC98E8AFA086}';
  CLSID_WICJpegXLDecoder: TGUID = '{fc6ceece-aef5-4a23-96ec-5984ffb486d9}';
  CLSID_WICJpegXLEncoder: TGUID = '{0e4ecd3b-1ba6-4636-8198-56c73040964a}';


  //*=========================================================================*\
  //  GUID Identifiers for the image container formats
  //*=========================================================================*/

  GUID_ContainerFormatBmp: TGUID = '{0af1d87e-fcfe-4188-bdeb-a7906471cbe3}';
  GUID_ContainerFormatPng: TGUID = '{1b7cfaf4-713f-473c-bbcd-6137425faeaf}';
  GUID_ContainerFormatIco: TGUID = '{a3a860c4-338f-4c17-919a-fba4b5628f21}';
  GUID_ContainerFormatJpeg: TGUID = '{19e4a5aa-5662-4fc5-a0c0-1758028e1057}';
  GUID_ContainerFormatTiff: TGUID = '{163bcc30-e2e9-4f0b-961d-a3e9fdb788a3}';
  GUID_ContainerFormatGif: TGUID = '{1f8a5601-7d4d-4cbd-9c82-1bc8d4eeb9a5}';
  GUID_ContainerFormatWmp: TGUID = '{57a37caa-367a-4540-916b-f183c5093a4b}';
  GUID_ContainerFormatDds: TGUID = '{9967cb95-2e85-4ac8-8ca2-83d7ccd425c9}';
  GUID_ContainerFormatAdng: TGUID = '{f3ff6d0d-38c0-41c4-b1fe-1f3824f17b84}';
  GUID_ContainerFormatHeif: TGUID = '{e1e62521-6787-405b-a339-500715b5763f}';
  GUID_ContainerFormatWebp: TGUID = '{e094b0e2-67f2-45b3-b0ea-115337ca7cf3}';
  GUID_ContainerFormatRaw: TGUID = '{fe99ce60-f19c-433c-a3ae-00acefa9ca21}';
  GUID_ContainerFormatJpegXL: TGUID = '{fec14e3f-427a-4736-aae6-27ed84f69322}';


  //*=========================================================================*\
  //  Category Identifiers
  //*=========================================================================*/

  CLSID_WICImagingCategories: TGUID = '{fae3d380-fea4-4623-8c75-c6b61110b681}';
  CATID_WICBitmapDecoders: TGUID = '{7ed96837-96f0-4812-b211-f13c24117ed3}';
  CATID_WICBitmapEncoders: TGUID = '{ac757296-3522-4e11-9862-c17be5a1767e}';
  CATID_WICPixelFormats: TGUID = '{2b46e70f-cda7-473e-89f6-dc9630a2390b}';
  CATID_WICFormatConverters: TGUID = '{7835eae8-bf14-49d1-93ce-533a407b2248}';
  CATID_WICMetadataReader: TGUID = '{05af94d8-7174-4cd2-be4a-4124b80ee4b8}';
  CATID_WICMetadataWriter: TGUID = '{abe3b9a4-257d-4b97-bd1a-294af496222e}';


  //*=========================================================================*\
  //  Format converters
  //*=========================================================================*/

  CLSID_WICDefaultFormatConverter: TGUID = '{1a3f11dc-b514-4b17-8c5f-2154513852f1}';
  CLSID_WICFormatConverterHighColor: TGUID = '{ac75d454-9f37-48f8-b972-4e19bc856011}';
  CLSID_WICFormatConverterNChannel: TGUID = '{c17cabb2-d4a3-47d7-a557-339b2efbd4f1}';
  CLSID_WICFormatConverterWMPhoto: TGUID = '{9cb5172b-d600-46ba-ab77-77bb7e3a00d9}';
  CLSID_WICPlanarFormatConverter: TGUID = '{184132b8-32f8-4784-9131-dd7224b23438}';


  WIC_JPEG_MAX_COMPONENT_COUNT = 4;
  WIC_JPEG_MAX_TABLE_INDEX = 3;

  WIC_JPEG_SAMPLE_FACTORS_ONE = $11;
  WIC_JPEG_SAMPLE_FACTORS_THREE_420 = $111122;
  WIC_JPEG_SAMPLE_FACTORS_THREE_422 = $111121;
  WIC_JPEG_SAMPLE_FACTORS_THREE_440 = $111112;
  WIC_JPEG_SAMPLE_FACTORS_THREE_444 = $111111;

  WIC_JPEG_QUANTIZATION_BASELINE_ONE = 0;
  WIC_JPEG_QUANTIZATION_BASELINE_THREE = $10100;

  WIC_JPEG_HUFFMAN_BASELINE_ONE = 0;
  WIC_JPEG_HUFFMAN_BASELINE_THREE = $111100;

  // Undefined formats
  GUID_WICPixelFormatDontCare: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc900}';

var
  GUID_WICPixelFormatUndefined: TGUID absolute GUID_WICPixelFormatDontCare;

const

  // Indexed formats
  GUID_WICPixelFormat1bppIndexed: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc901}';
  GUID_WICPixelFormat2bppIndexed: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc902}';
  GUID_WICPixelFormat4bppIndexed: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc903}';
  GUID_WICPixelFormat8bppIndexed: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc904}';

  // Grayscale formats
  GUID_WICPixelFormatBlackWhite: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc905}';
  GUID_WICPixelFormat2bppGray: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc906}';
  GUID_WICPixelFormat4bppGray: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc907}';
  GUID_WICPixelFormat8bppGray: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc908}';

  // Alpha only format
  GUID_WICPixelFormat8bppAlpha: TGUID = '{e6cd0116-eeba-4161-aa85-27dd9fb3a895}';

  // Depth only format
  GUID_WICPixelFormat8bppDepth: TGUID = '{4c9c9f45-1d89-4e31-9bc7-69343a0dca69}';

  // Gain only format
  GUID_WICPixelFormat8bppGain: TGUID = '{a884022a-af13-4c16-b746-619bf618b878}';
  GUID_WICPixelFormat24bppRGBGain: TGUID = '{a5022b24-7109-443b-9948-25b6ed8f39fd}';
  GUID_WICPixelFormat32bppBGRGain: TGUID = '{837d6738-208a-43e0-8995-79ab74407402}';

  // sRGB formats (gamma is approx. 2.2)
  // For a full definition, see the sRGB spec

  // 16bpp formats
  GUID_WICPixelFormat16bppBGR555: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc909}';
  GUID_WICPixelFormat16bppBGR565: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc90a}';
  GUID_WICPixelFormat16bppBGRA5551: TGUID = '{05ec7c2b-f1e6-4961-ad46-e1cc810a87d2}';
  GUID_WICPixelFormat16bppGray: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc90b}';

  // 24bpp formats
  GUID_WICPixelFormat24bppBGR: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc90c}';
  GUID_WICPixelFormat24bppRGB: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc90d}';

  // 32bpp formats
  GUID_WICPixelFormat32bppBGR: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc90e}';
  GUID_WICPixelFormat32bppBGRA: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc90f}';
  GUID_WICPixelFormat32bppPBGRA: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc910}';
  GUID_WICPixelFormat32bppGrayFloat: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc911}';
  //#if (_WIN32_WINNT >= _WIN32_WINNT_WIN8) || defined(_WIN7_PLATFORM_UPDATE)
  GUID_WICPixelFormat32bppRGB: TGUID = '{d98c6b95-3efe-47d6-bb25-eb1748ab0cf1}';
  //#endif
  GUID_WICPixelFormat32bppRGBA: TGUID = '{f5c7ad2d-6a8d-43dd-a7a8-a29935261ae9}';
  GUID_WICPixelFormat32bppPRGBA: TGUID = '{3cc4a650-a527-4d37-a916-3142c7ebedba}';

  // 48bpp formats
  GUID_WICPixelFormat48bppRGB: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc915}';
  GUID_WICPixelFormat48bppBGR: TGUID = '{e605a384-b468-46ce-bb2e-36f180e64313}';

  // 64bpp formats
  //#if (_WIN32_WINNT >= _WIN32_WINNT_WIN8) || defined(_WIN7_PLATFORM_UPDATE)
  GUID_WICPixelFormat64bppRGB: TGUID = '{a1182111-186d-4d42-bc6a-9c8303a8dff9}';
  //#endif
  GUID_WICPixelFormat64bppRGBA: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc916}';
  GUID_WICPixelFormat64bppBGRA: TGUID = '{1562ff7c-d352-46f9-979e-42976b792246}';
  GUID_WICPixelFormat64bppPRGBA: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc917}';
  GUID_WICPixelFormat64bppPBGRA: TGUID = '{8c518e8e-a4ec-468b-ae70-c9a35a9c5530}';

  // scRGB formats. Gamma is 1.0
  // For a full definition, see the scRGB specs

  // 16bpp format
  GUID_WICPixelFormat16bppGrayFixedPoint: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc913}';

  // 32bpp format
  GUID_WICPixelFormat32bppBGR101010: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc914}';

  // 48bpp formats
  GUID_WICPixelFormat48bppRGBFixedPoint: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc912}';
  GUID_WICPixelFormat48bppBGRFixedPoint: TGUID = '{49ca140e-cab6-493b-9ddf-60187c37532a}';

  // 96bpp formats
  GUID_WICPixelFormat96bppRGBFixedPoint: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc918}';
  //#if (_WIN32_WINNT >= _WIN32_WINNT_WIN8) || defined(_WIN7_PLATFORM_UPDATE)
  GUID_WICPixelFormat96bppRGBFloat: TGUID = '{e3fed78f-e8db-4acf-84c1-e97f6136b327}';
  //#endif

  // Floating point scRGB formats
  GUID_WICPixelFormat128bppRGBAFloat: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc919}';
  GUID_WICPixelFormat128bppPRGBAFloat: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc91a}';
  GUID_WICPixelFormat128bppRGBFloat: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc91b}';

  // CMYK format
  GUID_WICPixelFormat32bppCMYK: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc91c}';

  // Extended formats
  GUID_WICPixelFormat64bppRGBAFixedPoint: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc91d}';
  GUID_WICPixelFormat64bppBGRAFixedPoint: TGUID = '{356de33c-54d2-4a23-bb04-9b7bf9b1d42d}';
  GUID_WICPixelFormat64bppRGBFixedPoint: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc940}';
  GUID_WICPixelFormat128bppRGBAFixedPoint: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc91e}';
  GUID_WICPixelFormat128bppRGBFixedPoint: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc941}';


  GUID_WICPixelFormat64bppRGBAHalf: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc93a}';
  //#if (_WIN32_WINNT >= _WIN32_WINNT_WIN8) || defined(_WIN7_PLATFORM_UPDATE)
  GUID_WICPixelFormat64bppPRGBAHalf: TGUID = '{58ad26c2-c623-4d9d-b320-387e49f8c442}';
  //#endif
  GUID_WICPixelFormat64bppRGBHalf: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc942}';
  GUID_WICPixelFormat48bppRGBHalf: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc93b}';
  GUID_WICPixelFormat32bppRGBE: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc93d}';
  GUID_WICPixelFormat16bppGrayHalf: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc93e}';
  GUID_WICPixelFormat32bppGrayFixedPoint: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc93f}';
  GUID_WICPixelFormat32bppRGBA1010102: TGUID = '{25238D72-FCF9-4522-b514-5578e5ad55e0}';
  GUID_WICPixelFormat32bppRGBA1010102XR: TGUID = '{00DE6B9A-C101-434b-b502-d0165ee1122c}';

  // Note that for both BGR101010 and RGBA1010102, the red channel is stored in the least significant bits.  This format is different,
  //  with the red channel in the most significant bits.  The memory layout of R10G10B10A2 is RRRRRRRR RRGGGGGG GGGGBBBB BBBBBBAA when
  //  interpreted as a unit, and BBBBBBAA GGGGBBBB RRGGGGG RRRRRRRR when stored in memory on a little-endian device.

  GUID_WICPixelFormat32bppR10G10B10A2: TGUID = '{604e1bb5-8a3c-4b65-b11c-bc0b8dd75b7f}';

  // This is a 10 bit pixel format for HDR10(i.e., BT.2020 color space and SMPTE ST.2084 EOTF.)
  // The pixel format uses the same channel layout as GUID_WICPixelFormat32bppR10G10B10A2.
  // This layout is the same as DXGI_FORMAT_R10G10B10A2_UNORM.
  GUID_WICPixelFormat32bppR10G10B10A2HDR10: TGUID = '{9c215c5d-1acc-4f0e-a4bc-70fb3ae8fd28}';

  // More CMYK formats and n-Channel formats
  GUID_WICPixelFormat64bppCMYK: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc91f}';
  GUID_WICPixelFormat24bpp3Channels: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc920}';
  GUID_WICPixelFormat32bpp4Channels: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc921}';
  GUID_WICPixelFormat40bpp5Channels: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc922}';
  GUID_WICPixelFormat48bpp6Channels: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc923}';
  GUID_WICPixelFormat56bpp7Channels: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc924}';
  GUID_WICPixelFormat64bpp8Channels: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc925}';
  GUID_WICPixelFormat48bpp3Channels: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc926}';
  GUID_WICPixelFormat64bpp4Channels: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc927}';
  GUID_WICPixelFormat80bpp5Channels: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc928}';
  GUID_WICPixelFormat96bpp6Channels: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc929}';
  GUID_WICPixelFormat112bpp7Channels: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc92a}';
  GUID_WICPixelFormat128bpp8Channels: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc92b}';
  GUID_WICPixelFormat40bppCMYKAlpha: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc92c}';
  GUID_WICPixelFormat80bppCMYKAlpha: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc92d}';
  GUID_WICPixelFormat32bpp3ChannelsAlpha: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc92e}';
  GUID_WICPixelFormat40bpp4ChannelsAlpha: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc92f}';
  GUID_WICPixelFormat48bpp5ChannelsAlpha: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc930}';
  GUID_WICPixelFormat56bpp6ChannelsAlpha: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc931}';
  GUID_WICPixelFormat64bpp7ChannelsAlpha: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc932}';
  GUID_WICPixelFormat72bpp8ChannelsAlpha: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc933}';
  GUID_WICPixelFormat64bpp3ChannelsAlpha: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc934}';
  GUID_WICPixelFormat80bpp4ChannelsAlpha: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc935}';
  GUID_WICPixelFormat96bpp5ChannelsAlpha: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc936}';
  GUID_WICPixelFormat112bpp6ChannelsAlpha: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc937}';
  GUID_WICPixelFormat128bpp7ChannelsAlpha: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc938}';
  GUID_WICPixelFormat144bpp8ChannelsAlpha: TGUID = '{6fddc324-4e03-4bfe-b185-3d77768dc939}';

  // Planar formats
  GUID_WICPixelFormat8bppY: TGUID = '{91B4DB54-2DF9-42F0-B449-2909BB3DF88E}';
  GUID_WICPixelFormat8bppCb: TGUID = '{1339F224-6BFE-4C3E-9302-E4F3A6D0CA2A}';
  GUID_WICPixelFormat8bppCr: TGUID = '{B8145053-2116-49F0-8835-ED844B205C51}';
  GUID_WICPixelFormat16bppCbCr: TGUID = '{FF95BA6E-11E0-4263-BB45-01721F3460A4}';

  // Jpeg Quantized DCT coefficients
  GUID_WICPixelFormat16bppYQuantizedDctCoefficients: TGUID = '{A355F433-48E8-4A42-84D8-E2AA26CA80A4}';
  GUID_WICPixelFormat16bppCbQuantizedDctCoefficients: TGUID = '{D2C4FF61-56A5-49C2-8B5C-4C1925964837}';
  GUID_WICPixelFormat16bppCrQuantizedDctCoefficients: TGUID = '{2FE354F0-1680-42D8-9231-E73C0565BFC1}';

  // From intsafe.h
  // Do not re-introduce, to prevent clashes in later versions where intsafe.h will be included
  // INTSAFE_E_ARITHMETIC_OVERFLOW       = HResult($80070216);  // $216 = 534 = ERROR_ARITHMETIC_OVERFLOW
  // end

  WINCODEC_ERR_GENERIC_ERROR = E_FAIL;
  WINCODEC_ERR_INVALIDPARAMETER = E_INVALIDARG;
  WINCODEC_ERR_OUTOFMEMORY = E_OUTOFMEMORY;
  WINCODEC_ERR_NOTIMPLEMENTED = E_NOTIMPL;
  WINCODEC_ERR_ABORTED = E_ABORT;
  WINCODEC_ERR_ACCESSDENIED = E_ACCESSDENIED;
  WINCODEC_ERR_VALUEOVERFLOW = HResult($80070216); //INTSAFE_E_ARITHMETIC_OVERFLOW;

const

  FACILITY_WINCODEC_ERR = $898;
  WINCODEC_ERR_BASE = $2000;


  // Enums =======================================================================

type
  PWICColorContextType = ^WICColorContextType;
  WICColorContextType = DWord;

const
  WICColorContextUninitialized = WICColorContextType(0);
  WICColorContextProfile = WICColorContextType($1);
  WICColorContextExifColorSpace = WICColorContextType($2);


type
  PWICBitmapCreateCacheOption = ^WICBitmapCreateCacheOption;
  WICBitmapCreateCacheOption = DWord;

const
  WICBitmapNoCache = WICBitmapCreateCacheOption(0);
  WICBitmapCacheOnDemand = WICBitmapCreateCacheOption($1);
  WICBitmapCacheOnLoad = WICBitmapCreateCacheOption($2);

type
  PWICDecodeOptions = ^WICDecodeOptions;
  WICDecodeOptions = DWord;

const
  WICDecodeMetadataCacheOnDemand = WICDecodeOptions(0);
  WICDecodeMetadataCacheOnLoad = WICDecodeOptions($1);

type
  PWICBitmapEncoderCacheOption = ^WICBitmapEncoderCacheOption;
  WICBitmapEncoderCacheOption = DWord;

const
  WICBitmapEncoderCacheInMemory = WICBitmapEncoderCacheOption(0);
  WICBitmapEncoderCacheTempFile = WICBitmapEncoderCacheOption($1);
  WICBitmapEncoderNoCache = WICBitmapEncoderCacheOption($2);

type
  PWICComponentType = ^WICComponentType;
  WICComponentType = DWord;

const
  WICDecoder = WICComponentType($1);
  WICEncoder = WICComponentType($2);
  WICPixelFormatConverter = WICComponentType($4);
  WICMetadataReader = WICComponentType($8);
  WICMetadataWriter = WICComponentType($10);
  WICPixelFormat = WICComponentType($20);
  WICAllComponents = WICComponentType($3F);

type
  PWICComponentEnumerateOptions = ^WICComponentEnumerateOptions;
  WICComponentEnumerateOptions = DWord;

const
  WICComponentEnumerateDefault = WICComponentEnumerateOptions(0);
  WICComponentEnumerateRefresh = WICComponentEnumerateOptions($1);
  WICComponentEnumerateDisabled = WICComponentEnumerateOptions($80000000);
  WICComponentEnumerateUnsigned = WICComponentEnumerateOptions($40000000);
  WICComponentEnumerateBuiltInOnly = WICComponentEnumerateOptions($20000000);

type
  PWICBitmapInterpolationMode = ^WICBitmapInterpolationMode;
  WICBitmapInterpolationMode = DWord;

const
  WICBitmapInterpolationModeNearestNeighbor = WICBitmapInterpolationMode(0);
  WICBitmapInterpolationModeLinear = WICBitmapInterpolationMode($1);
  WICBitmapInterpolationModeCubic = WICBitmapInterpolationMode($2);
  WICBitmapInterpolationModeFant = WICBitmapInterpolationMode($3);
  WICBitmapInterpolationModeHighQualityCubic = WICBitmapInterpolationMode($4);

type
  PWICBitmapPaletteType = ^WICBitmapPaletteType;
  WICBitmapPaletteType = DWord;

const
  WICBitmapPaletteTypeCustom = WICBitmapPaletteType(0);
  WICBitmapPaletteTypeMedianCut = WICBitmapPaletteType($1);
  WICBitmapPaletteTypeFixedBW = WICBitmapPaletteType($2);
  WICBitmapPaletteTypeFixedHalftone8 = WICBitmapPaletteType($3);
  WICBitmapPaletteTypeFixedHalftone27 = WICBitmapPaletteType($4);
  WICBitmapPaletteTypeFixedHalftone64 = WICBitmapPaletteType($5);
  WICBitmapPaletteTypeFixedHalftone125 = WICBitmapPaletteType($6);
  WICBitmapPaletteTypeFixedHalftone216 = WICBitmapPaletteType($7);
  WICBitmapPaletteTypeFixedWebPalette = WICBitmapPaletteTypeFixedHalftone216;
  WICBitmapPaletteTypeFixedHalftone252 = WICBitmapPaletteType($8);
  WICBitmapPaletteTypeFixedHalftone256 = WICBitmapPaletteType($9);
  WICBitmapPaletteTypeFixedGray4 = WICBitmapPaletteType($A);
  WICBitmapPaletteTypeFixedGray16 = WICBitmapPaletteType($B);
  WICBitmapPaletteTypeFixedGray256 = WICBitmapPaletteType($C);


type
  PWICBitmapDitherType = ^WICBitmapDitherType;
  WICBitmapDitherType = DWord;

const
  WICBitmapDitherTypeNone = WICBitmapDitherType(0);
  WICBitmapDitherTypeSolid = WICBitmapDitherType(0);
  WICBitmapDitherTypeOrdered4x4 = WICBitmapDitherType($1);
  WICBitmapDitherTypeOrdered8x8 = WICBitmapDitherType($2);
  WICBitmapDitherTypeOrdered16x16 = WICBitmapDitherType($3);
  WICBitmapDitherTypeSpiral4x4 = WICBitmapDitherType($4);
  WICBitmapDitherTypeSpiral8x8 = WICBitmapDitherType($5);
  WICBitmapDitherTypeDualSpiral4x4 = WICBitmapDitherType($6);
  WICBitmapDitherTypeDualSpiral8x8 = WICBitmapDitherType($7);
  WICBitmapDitherTypeErrorDiffusion = WICBitmapDitherType($8);


type
  PWICBitmapAlphaChannelOption = ^WICBitmapAlphaChannelOption;
  WICBitmapAlphaChannelOption = DWord;

const
  WICBitmapUseAlpha = WICBitmapAlphaChannelOption(0);
  WICBitmapUsePremultipliedAlpha = WICBitmapAlphaChannelOption($1);
  WICBitmapIgnoreAlpha = WICBitmapAlphaChannelOption($2);


type
  PWICBitmapTransformOptions = ^WICBitmapTransformOptions;
  WICBitmapTransformOptions = DWord;

const
  WICBitmapTransformRotate0 = WICBitmapTransformOptions(0);
  WICBitmapTransformRotate90 = WICBitmapTransformOptions($1);
  WICBitmapTransformRotate180 = WICBitmapTransformOptions($2);
  WICBitmapTransformRotate270 = WICBitmapTransformOptions($3);
  WICBitmapTransformFlipHorizontal = WICBitmapTransformOptions($8);
  WICBitmapTransformFlipVertical = WICBitmapTransformOptions($10);


type
  PWICBitmapLockFlags = ^WICBitmapLockFlags;
  WICBitmapLockFlags = DWord;

const
  WICBitmapLockRead = WICBitmapLockFlags($1);
  WICBitmapLockWrite = WICBitmapLockFlags($2);


type
  PWICBitmapDecoderCapabilities = ^WICBitmapDecoderCapabilities;
  WICBitmapDecoderCapabilities = DWord;

const
  WICBitmapDecoderCapabilitySameEncoder = WICBitmapDecoderCapabilities($1);
  WICBitmapDecoderCapabilityCanDecodeAllImages = WICBitmapDecoderCapabilities($2);
  WICBitmapDecoderCapabilityCanDecodeSomeImages = WICBitmapDecoderCapabilities($4);
  WICBitmapDecoderCapabilityCanEnumerateMetadata = WICBitmapDecoderCapabilities($8);
  WICBitmapDecoderCapabilityCanDecodeThumbnail = WICBitmapDecoderCapabilities($10);


type
  PWICProgressOperation = ^WICProgressOperation;
  WICProgressOperation = DWord;

const
  WICProgressOperationCopyPixels = WICProgressOperation($1);
  WICProgressOperationWritePixels = WICProgressOperation($2);
  WICProgressOperationAll = WICProgressOperation($FFFF);


type
  PWICProgressNotification = ^WICProgressNotification;
  WICProgressNotification = DWord;

const
  WICProgressNotificationBegin = WICProgressNotification($10000);
  WICProgressNotificationEnd = WICProgressNotification($20000);
  WICProgressNotificationFrequent = WICProgressNotification($40000);
  WICProgressNotificationAll = WICProgressNotification($FFFF0000);


type
  PWICComponentSigning = ^WICComponentSigning;
  WICComponentSigning = DWord;

const
  WICComponentSigned = WICComponentSigning($1);
  WICComponentUnsigned = WICComponentSigning($2);
  WICComponentSafe = WICComponentSigning($4);
  WICComponentDisabled = WICComponentSigning($80000000);


  //=========================================================================*\
  //  WICBitmapToneMappingModes
  //=========================================================================*/
type
  PWICBitmapToneMappingMode = ^WICBitmapToneMappingMode;
  WICBitmapToneMappingMode = DWord;

const
  WICBitmapToneMappingMode_None = WICBitmapToneMappingMode(0);
  WICBitmapToneMappingMode_Default = WICBitmapToneMappingMode($1);
  WICBitmapToneMappingMode_D2D = WICBitmapToneMappingMode($2);
  WICBitmapToneMappingMode_GainMap = WICBitmapToneMappingMode($3);


  //=========================================================================*\
  //  WICBitmapChainType
  //=========================================================================*/
type
  PWICBitmapChainType = ^WICBitmapChainType;
  WICBitmapChainType = DWord;

const
  WICBitmapChainType_Alternate = WICBitmapChainType($1);
  WICBitmapChainType_Layer = WICBitmapChainType($2);
  WICBitmapChainType_Preview = WICBitmapChainType($3);
  WICBitmapChainType_Thumbnail = WICBitmapChainType($4);
  WICBitmapChainType_AlphaMap = WICBitmapChainType($5);
  WICBitmapChainType_DepthMap = WICBitmapChainType($6);
  WICBitmapChainType_GainMap = WICBitmapChainType($7);


  //=========================================================================*\
  //  WICGifLogicalScreenDescriptorProperties
  //=========================================================================*/
type
  PWICGifLogicalScreenDescriptorProperties = ^WICGifLogicalScreenDescriptorProperties;
  WICGifLogicalScreenDescriptorProperties = DWord;

const
  WICGifLogicalScreenSignature = WICGifLogicalScreenDescriptorProperties($1);
  WICGifLogicalScreenDescriptorWidth = WICGifLogicalScreenDescriptorProperties($2);
  WICGifLogicalScreenDescriptorHeight = WICGifLogicalScreenDescriptorProperties($3);
  WICGifLogicalScreenDescriptorGlobalColorTableFlag = WICGifLogicalScreenDescriptorProperties($4);
  WICGifLogicalScreenDescriptorColorResolution = WICGifLogicalScreenDescriptorProperties($5);
  WICGifLogicalScreenDescriptorSortFlag = WICGifLogicalScreenDescriptorProperties($6);
  WICGifLogicalScreenDescriptorGlobalColorTableSize = WICGifLogicalScreenDescriptorProperties($7);
  WICGifLogicalScreenDescriptorBackgroundColorIndex = WICGifLogicalScreenDescriptorProperties($8);
  WICGifLogicalScreenDescriptorPixelAspectRatio = WICGifLogicalScreenDescriptorProperties($9);


  //=========================================================================*\
  //  WICGifImageDescriptorProperties
  //=========================================================================*/
type
  PWICGifImageDescriptorProperties = ^WICGifImageDescriptorProperties;
  WICGifImageDescriptorProperties = DWord;

const
  WICGifImageDescriptorLeft = WICGifImageDescriptorProperties($1);
  WICGifImageDescriptorTop = WICGifImageDescriptorProperties($2);
  WICGifImageDescriptorWidth = WICGifImageDescriptorProperties($3);
  WICGifImageDescriptorHeight = WICGifImageDescriptorProperties($4);
  WICGifImageDescriptorLocalColorTableFlag = WICGifImageDescriptorProperties($5);
  WICGifImageDescriptorInterlaceFlag = WICGifImageDescriptorProperties($6);
  WICGifImageDescriptorSortFlag = WICGifImageDescriptorProperties($7);
  WICGifImageDescriptorLocalColorTableSize = WICGifImageDescriptorProperties($8);


  //=========================================================================*\
  //  WICGifGraphicControlExtensionProperties
  //=========================================================================*/
type
  PWICGifGraphicControlExtensionProperties = ^WICGifGraphicControlExtensionProperties;
  WICGifGraphicControlExtensionProperties = DWord;

const
  WICGifGraphicControlExtensionDisposal = WICGifGraphicControlExtensionProperties($1);
  WICGifGraphicControlExtensionUserInputFlag = WICGifGraphicControlExtensionProperties($2);
  WICGifGraphicControlExtensionTransparencyFlag = WICGifGraphicControlExtensionProperties($3);
  WICGifGraphicControlExtensionDelay = WICGifGraphicControlExtensionProperties($4);
  WICGifGraphicControlExtensionTransparentColorIndex = WICGifGraphicControlExtensionProperties($5);


  //=========================================================================*\
  //  WICGifApplicationExtensionProperties
  //=========================================================================*/
type
  PWICGifApplicationExtensionProperties = ^WICGifApplicationExtensionProperties;
  WICGifApplicationExtensionProperties = DWord;

const
  WICGifApplicationExtensionApplication = WICGifApplicationExtensionProperties($1);
  WICGifApplicationExtensionData = WICGifApplicationExtensionProperties($2);



  //=========================================================================*\
  //  WICGifCommentExtensionProperties
  //=========================================================================*/
type
  PWICGifCommentExtensionProperties = ^WICGifCommentExtensionProperties;
  WICGifCommentExtensionProperties = DWord;

const
  WICGifCommentExtensionText = WICGifCommentExtensionProperties($1);
  //WICGifCommentExtensionProperties_FORCE_DWORD = FORCEDWORD;


  //=========================================================================*\
  //  WICJpegCommentProperties
  //=========================================================================*/
type
  PWICJpegCommentProperties = ^WICJpegCommentProperties;
  WICJpegCommentProperties = DWord;

const
  WICJpegCommentText = WICJpegCommentProperties($1);


  //=========================================================================*\
  //  WICJpegLuminanceProperties
  //=========================================================================*/
type
  PWICJpegLuminanceProperties = ^WICJpegLuminanceProperties;
  WICJpegLuminanceProperties = DWord;

const
  WICJpegLuminanceTable = WICJpegLuminanceProperties($1);


  //=========================================================================*\
  //  WICJpegChrominanceProperties
  //=========================================================================*/
type
  PWICJpegChrominanceProperties = ^WICJpegChrominanceProperties;
  WICJpegChrominanceProperties = DWord;

const
  WICJpegChrominanceTable = WICJpegChrominanceProperties($1);


  //=========================================================================*\
  //  WIC8BIMIptcProperties
  //=========================================================================*/
type
  PWIC8BIMIptcProperties = ^WIC8BIMIptcProperties;
  WIC8BIMIptcProperties = DWord;

const
  WIC8BIMIptcPString = WIC8BIMIptcProperties(0);
  WIC8BIMIptcEmbeddedIPTC = WIC8BIMIptcProperties($1);


  //=========================================================================*\
  //  WIC8BIMResolutionInfoProperties
  //=========================================================================*/
type
  PWIC8BIMResolutionInfoProperties = ^WIC8BIMResolutionInfoProperties;
  WIC8BIMResolutionInfoProperties = DWord;

const
  WIC8BIMResolutionInfoPString = WIC8BIMResolutionInfoProperties($1);
  WIC8BIMResolutionInfoHResolution = WIC8BIMResolutionInfoProperties($2);
  WIC8BIMResolutionInfoHResolutionUnit = WIC8BIMResolutionInfoProperties($3);
  WIC8BIMResolutionInfoWidthUnit = WIC8BIMResolutionInfoProperties($4);
  WIC8BIMResolutionInfoVResolution = WIC8BIMResolutionInfoProperties($5);
  WIC8BIMResolutionInfoVResolutionUnit = WIC8BIMResolutionInfoProperties($6);
  WIC8BIMResolutionInfoHeightUnit = WIC8BIMResolutionInfoProperties($7);


  //=========================================================================*\
  //  WIC8BIMIptcDigestProperties
  //=========================================================================*/
type
  PWIC8BIMIptcDigestProperties = ^WIC8BIMIptcDigestProperties;
  WIC8BIMIptcDigestProperties = DWord;

const
  WIC8BIMIptcDigestPString = WIC8BIMIptcDigestProperties($1);
  WIC8BIMIptcDigestIptcDigest = WIC8BIMIptcDigestProperties($2);


  //=========================================================================*\
  //  WICPngGamaProperties
  //=========================================================================*/
type
  PWICPngGamaProperties = ^WICPngGamaProperties;
  WICPngGamaProperties = DWord;

const
  WICPngGamaGamma = WICPngGamaProperties($1);


  //=========================================================================*\
  //  WICPngBkgdProperties
  //=========================================================================*/
type
  PWICPngBkgdProperties = ^WICPngBkgdProperties;
  WICPngBkgdProperties = DWord;

const
  WICPngBkgdBackgroundColor = WICPngBkgdProperties($1);


  //=========================================================================*\
  //  WICPngItxtProperties
  //=========================================================================*/
type
  PWICPngItxtProperties = ^WICPngItxtProperties;
  WICPngItxtProperties = DWord;

const
  WICPngItxtKeyword = WICPngItxtProperties($1);
  WICPngItxtCompressionFlag = WICPngItxtProperties($2);
  WICPngItxtLanguageTag = WICPngItxtProperties($3);
  WICPngItxtTranslatedKeyword = WICPngItxtProperties($4);
  WICPngItxtText = WICPngItxtProperties($5);


  //=========================================================================*\
  //  WICPngChrmProperties
  //=========================================================================*/
type
  PWICPngChrmProperties = ^WICPngChrmProperties;
  WICPngChrmProperties = DWord;

const
  WICPngChrmWhitePointX = WICPngChrmProperties($1);
  WICPngChrmWhitePointY = WICPngChrmProperties($2);
  WICPngChrmRedX = WICPngChrmProperties($3);
  WICPngChrmRedY = WICPngChrmProperties($4);
  WICPngChrmGreenX = WICPngChrmProperties($5);
  WICPngChrmGreenY = WICPngChrmProperties($6);
  WICPngChrmBlueX = WICPngChrmProperties($7);
  WICPngChrmBlueY = WICPngChrmProperties($8);


  //=========================================================================*\
  //  WICPngHistProperties
  //=========================================================================*/
type
  PWICPngHistProperties = ^WICPngHistProperties;
  WICPngHistProperties = DWord;

const
  WICPngHistFrequencies = WICPngHistProperties($1);


  //=========================================================================*\
  //  WICPngIccpProperties
  //=========================================================================*/
type
  PWICPngIccpProperties = ^WICPngIccpProperties;
  WICPngIccpProperties = DWord;

const
  WICPngIccpProfileName = WICPngIccpProperties($1);
  WICPngIccpProfileData = WICPngIccpProperties($2);


  //=========================================================================*\
  //  WICPngSrgbProperties
  //=========================================================================*/
type
  PWICPngSrgbProperties = ^WICPngSrgbProperties;
  WICPngSrgbProperties = DWord;

const
  WICPngSrgbRenderingIntent = WICPngSrgbProperties($1);


  //=========================================================================*\
  //  WICPngTimeProperties
  //=========================================================================*/
type
  PWICPngTimeProperties = ^WICPngTimeProperties;
  WICPngTimeProperties = DWord;

const
  WICPngTimeYear = WICPngTimeProperties($1);
  WICPngTimeMonth = WICPngTimeProperties($2);
  WICPngTimeDay = WICPngTimeProperties($3);
  WICPngTimeHour = WICPngTimeProperties($4);
  WICPngTimeMinute = WICPngTimeProperties($5);
  WICPngTimeSecond = WICPngTimeProperties($6);


  //=========================================================================*\
  //  WICHeifProperties
  //=========================================================================*/
type
  PWICHeifProperties = ^WICHeifProperties;
  WICHeifProperties = DWord;

const
  WICHeifOrientation = WICHeifProperties($1);
  // WICColor (VT_UI4).
  // The image is an layered image if this property is present and not VT_EMPTY.
  WICHeifLayeredImageCanvasColor = WICHeifProperties($2);

  // Array of POINT structures, specifying the coordinates of each layer image
  // in the canvas (VT_VECTOR | VT_UI8)
  WICHeifLayeredImageLayerPositions = WICHeifProperties($3);


  //=========================================================================*\
  //  WICHeifHdrProperties
  //=========================================================================*/
type
  PWICHeifHdrProperties = ^WICHeifHdrProperties;
  WICHeifHdrProperties = DWord;

const
  WICHeifHdrMaximumLuminanceLevel = WICHeifHdrProperties($1);
  WICHeifHdrMaximumFrameAverageLuminanceLevel = WICHeifHdrProperties($2);
  WICHeifHdrMinimumMasteringDisplayLuminanceLevel = WICHeifHdrProperties($3);
  WICHeifHdrMaximumMasteringDisplayLuminanceLevel = WICHeifHdrProperties($4);
  WICHeifHdrCustomVideoPrimaries = WICHeifHdrProperties($5);


  //=========================================================================*\
  //  WICWebpAnimProperties
  //=========================================================================*/
type
  PWICWebpAnimProperties = ^WICWebpAnimProperties;
  WICWebpAnimProperties = DWord;

const
  WICWebpAnimLoopCount = WICWebpAnimProperties($1);


  //=========================================================================*\
  //  WICWebpAnmfProperties
  //=========================================================================*/
type
  PWICWebpAnmfProperties = ^WICWebpAnmfProperties;
  WICWebpAnmfProperties = DWord;

const
  WICWebpAnmfFrameDuration = WICWebpAnmfProperties($1);


  //=========================================================================*\
  //  WICWebpAnmfProperties
  //=========================================================================*/
type
  PWICJpegXLAnimProperties = ^WICJpegXLAnimProperties;
  WICJpegXLAnimProperties = DWord;

const
  WICJpegXLAnimLoopCount = WICJpegXLAnimProperties($1);
  WICJpegXLAnimFrameTicksPerSecondNumerator = WICJpegXLAnimProperties($2);
  WICJpegXLAnimFrameTicksPerSecondDenominator = WICJpegXLAnimProperties($3);


  //=========================================================================*\
  //  WICJpegXLAnimFrameProperties
  //=========================================================================*/
type
  WICJpegXLAnimFrameProperties = DWord;

const
  WICJpegXLAnimFrameDurationInTicks = WICJpegXLAnimFrameProperties($1);
  WICJpegXLAnimFrameName = WICJpegXLAnimFrameProperties($2);


  //=========================================================================*\
  //  WICGainMapProperties
  //=========================================================================*/
type
  WICGainMapProperties = DWord;

const
  WICGainMapMetadata = WICGainMapProperties($1);  // In ISO 21496-1 format


  //=========================================================================*\
  //  WICSectionAccessLevel
  //=========================================================================*/
type
  PWICSectionAccessLevel = ^WICSectionAccessLevel;
  WICSectionAccessLevel = DWord;

const
  WICSectionAccessLevelRead = WICSectionAccessLevel($1);
  WICSectionAccessLevelReadWrite = WICSectionAccessLevel($3);


  //=========================================================================*\
  //  WICPixelFormatNumericRepresentation
  //=========================================================================*/
type
  PWICPixelFormatNumericRepresentation = ^WICPixelFormatNumericRepresentation;
  WICPixelFormatNumericRepresentation = DWord;

const
  WICPixelFormatNumericRepresentationUnspecified = WICPixelFormatNumericRepresentation(0);
  WICPixelFormatNumericRepresentationIndexed = WICPixelFormatNumericRepresentation($1);
  WICPixelFormatNumericRepresentationUnsignedInteger = WICPixelFormatNumericRepresentation($2);
  WICPixelFormatNumericRepresentationSignedInteger = WICPixelFormatNumericRepresentation($3);
  WICPixelFormatNumericRepresentationFixed = WICPixelFormatNumericRepresentation($4);
  WICPixelFormatNumericRepresentationFloat = WICPixelFormatNumericRepresentation($5);


  //=========================================================================*\
  //  WICPlanarOptions
  //=========================================================================*/
type
  PWICPlanarOptions = ^WICPlanarOptions;
  WICPlanarOptions = DWord;

const
  WICPlanarOptionsDefault = WICPlanarOptions(0);
  WICPlanarOptionsPreserveSubsampling = WICPlanarOptions($1);


  //=========================================================================*\
  //  WICJpegIndexingOptions
  //=========================================================================*/
type
  PWICJpegIndexingOptions = ^WICJpegIndexingOptions;
  WICJpegIndexingOptions = DWord;

const
  WICJpegIndexingOptionsGenerateOnDemand = WICJpegIndexingOptions(0);
  WICJpegIndexingOptionsGenerateOnLoad = WICJpegIndexingOptions($1);


  //=========================================================================*\
  //  WICJpegTransferMatrix
  //=========================================================================*/
type
  PWICJpegTransferMatrix = ^WICJpegTransferMatrix;
  WICJpegTransferMatrix = DWord;

const
  WICJpegTransferMatrixIdentity = WICJpegTransferMatrix(0);
  WICJpegTransferMatrixBT601 = WICJpegTransferMatrix($1);


  //=========================================================================*\
  //  WICJpegScanType
  //=========================================================================*/
type
  PWICJpegScanType = ^WICJpegScanType;
  WICJpegScanType = DWord;

const
  WICJpegScanTypeInterleaved = WICJpegScanType(0);
  WICJpegScanTypePlanarComponents = WICJpegScanType($1);
  WICJpegScanTypeProgressive = WICJpegScanType($2);


  //=========================================================================*\
  //  WICTiffCompressionOption
  //=========================================================================*/
type
  PWICTiffCompressionOption = ^WICTiffCompressionOption;
  WICTiffCompressionOption = DWord;

const
  WICTiffCompressionDontCare = WICTiffCompressionOption(0);
  WICTiffCompressionNone = WICTiffCompressionOption($1);
  WICTiffCompressionCCITT3 = WICTiffCompressionOption($2);
  WICTiffCompressionCCITT4 = WICTiffCompressionOption($3);
  WICTiffCompressionLZW = WICTiffCompressionOption($4);
  WICTiffCompressionRLE = WICTiffCompressionOption($5);
  WICTiffCompressionZIP = WICTiffCompressionOption($6);
  WICTiffCompressionLZWHDifferencing = WICTiffCompressionOption($7);


  //=========================================================================*\
  //  WICJpegYCrCbSubsamplingOption
  //=========================================================================*/
type
  PWICJpegYCrCbSubsamplingOption = ^WICJpegYCrCbSubsamplingOption;
  WICJpegYCrCbSubsamplingOption = DWord;

const
  WICJpegYCrCbSubsamplingDefault = WICJpegYCrCbSubsamplingOption(0);
  WICJpegYCrCbSubsampling420 = WICJpegYCrCbSubsamplingOption($1);
  WICJpegYCrCbSubsampling422 = WICJpegYCrCbSubsamplingOption($2);
  WICJpegYCrCbSubsampling444 = WICJpegYCrCbSubsamplingOption($3);
  WICJpegYCrCbSubsampling440 = WICJpegYCrCbSubsamplingOption($4);


  //=========================================================================*\
  //  WICPngFilterOption
  //=========================================================================*/
type
  PWICPngFilterOption = ^WICPngFilterOption;
  WICPngFilterOption = DWord;

const
  WICPngFilterUnspecified = WICPngFilterOption(0);
  WICPngFilterNone = WICPngFilterOption($1);
  WICPngFilterSub = WICPngFilterOption($2);
  WICPngFilterUp = WICPngFilterOption($3);
  WICPngFilterAverage = WICPngFilterOption($4);
  WICPngFilterPaeth = WICPngFilterOption($5);
  WICPngFilterAdaptive = WICPngFilterOption($6);


  //=========================================================================*\
  //  WICHeifCompressionOption
  //=========================================================================*/
type
  PWICHeifCompressionOption = ^WICHeifCompressionOption;
  WICHeifCompressionOption = DWord;

const

  WICHeifCompressionDontCare = WICHeifCompressionOption(0);
  WICHeifCompressionNone = WICHeifCompressionOption($1);
  WICHeifCompressionHEVC = WICHeifCompressionOption($2);
  WICHeifCompressionAV1 = WICHeifCompressionOption($3);
  WICHeifCompressionJpegXL = WICHeifCompressionOption($4);
  WICHeifCompressionBrotli = WICHeifCompressionOption($5);
  WICHeifCompressionDeflate = WICHeifCompressionOption($6);


  //=========================================================================*\
  //  WICNamedWhitePoint
  //=========================================================================*/
type
  PWICNamedWhitePoint = ^WICNamedWhitePoint;
  WICNamedWhitePoint = DWord;

const
  WICWhitePointDefault = WICNamedWhitePoint($1);
  WICWhitePointDaylight = WICNamedWhitePoint($2);
  WICWhitePointCloudy = WICNamedWhitePoint($4);
  WICWhitePointShade = WICNamedWhitePoint($8);
  WICWhitePointTungsten = WICNamedWhitePoint($10);
  WICWhitePointFluorescent = WICNamedWhitePoint($20);
  WICWhitePointFlash = WICNamedWhitePoint($40);
  WICWhitePointUnderwater = WICNamedWhitePoint($80);
  WICWhitePointCustom = WICNamedWhitePoint($100);  // when using a picture (grey-card) as white-balance
  WICWhitePointAutoWhiteBalance = WICNamedWhitePoint($200);
  WICWhitePointAsShot = WICWhitePointDefault;


  //=========================================================================*\
  //  WICRawCapabilities
  //=========================================================================*/
type
  PWICRawCapabilities = ^WICRawCapabilities;
  WICRawCapabilities = DWord;

const
  WICRawCapabilityNotSupported = WICRawCapabilities(0);
  WICRawCapabilityGetSupported = WICRawCapabilities($1);
  WICRawCapabilityFullySupported = WICRawCapabilities($2);


  //=========================================================================*\
  //  WICRawRotationCapabilities
  //=========================================================================*/
type
  PWICRawRotationCapabilities = ^WICRawRotationCapabilities;
  WICRawRotationCapabilities = DWord;

const
  WICRawRotationCapabilityNotSupported = WICRawRotationCapabilities(0);
  WICRawRotationCapabilityGetSupported = WICRawRotationCapabilities($1);
  WICRawRotationCapabilityNinetyDegreesSupported = WICRawRotationCapabilities($2);
  WICRawRotationCapabilityFullySupported = WICRawRotationCapabilities($3);


  //=========================================================================*\
  //  WICRawCapabilitesInfo
  //=========================================================================*/
type
  PWICRawCapabilitiesInfo = ^WICRawCapabilitiesInfo;

  WICRawCapabilitiesInfo = record
    cbSize: UINT;
    CodecMajorVersion: UINT;
    CodecMinorVersion: UINT;
    ExposureCompensationSupport: WICRawCapabilities;
    ContrastSupport: WICRawCapabilities;
    RGBWhitePointSupport: WICRawCapabilities;
    NamedWhitePointSupport: WICRawCapabilities;
    NamedWhitePointSupportMask: UINT;
    KelvinWhitePointSupport: WICRawCapabilities;
    GammaSupport: WICRawCapabilities;
    TintSupport: WICRawCapabilities;
    SaturationSupport: WICRawCapabilities;
    SharpnessSupport: WICRawCapabilities;
    NoiseReductionSupport: WICRawCapabilities;
    DestinationColorProfileSupport: WICRawCapabilities;
    ToneCurveSupport: WICRawCapabilities;
    RotationSupport: WICRawRotationCapabilities;
    RenderModeSupport: WICRawCapabilities;
  end;


  //=========================================================================*\
  //  WICRawParameterSet
  //=========================================================================*/
type
  PWICRawParameterSet = ^WICRawParameterSet;
  WICRawParameterSet = DWord;

const
  WICAsShotParameterSet = WICRawParameterSet($1);
  WICUserAdjustedParameterSet = WICRawParameterSet($2);
  WICAutoAdjustedParameterSet = WICRawParameterSet($3);


  //=========================================================================*\
  //  WICRawRenderMode
  //=========================================================================*/
type
  PWICRawRenderMode = ^WICRawRenderMode;
  WICRawRenderMode = DWord;

const
  WICRawRenderModeDraft = WICRawRenderMode($1);
  WICRawRenderModeNormal = WICRawRenderMode($2);
  WICRawRenderModeBestQuality = WICRawRenderMode($3);


  //=========================================================================*\
  //  WICRawToneCurvePoint
  //=========================================================================*/
type
  PWICRawToneCurvePoint = ^WICRawToneCurvePoint;

  WICRawToneCurvePoint = record
    Input: Double;
    Output: Double;
  end;


  //=========================================================================*\
  //  WICRawToneCurve
  //=========================================================================*/
  PWICRawToneCurve = ^WICRawToneCurve;

  WICRawToneCurve = record
    cPoints: UINT;
    aPoints: array[0..0] of WICRawToneCurvePoint;
  end;


  //=========================================================================*\
  //  IWICDevelopRawNotificationCallback
  //=========================================================================*/
const
  WICRawChangeNotification_ExposureCompensation = $00000001;
  WICRawChangeNotification_NamedWhitePoint = $00000002;
  WICRawChangeNotification_KelvinWhitePoint = $00000004;
  WICRawChangeNotification_RGBWhitePoint = $00000008;
  WICRawChangeNotification_Contrast = $00000010;
  WICRawChangeNotification_Gamma = $00000020;
  WICRawChangeNotification_Sharpness = $00000040;
  WICRawChangeNotification_Saturation = $00000080;
  WICRawChangeNotification_Tint = $00000100;
  WICRawChangeNotification_NoiseReduction = $00000200;
  WICRawChangeNotification_DestinationColorContext = $00000400;
  WICRawChangeNotification_ToneCurve = $00000800;
  WICRawChangeNotification_Rotation = $00001000;
  WICRawChangeNotification_RenderMode = $00002000;


  //=========================================================================*\
  //  WICDdsDimension
  //=========================================================================*/
type
  PWICDdsDimension = ^WICDdsDimension;
  WICDdsDimension = DWord;

const
  WICDdsTexture1D = WICDdsDimension(0);
  WICDdsTexture2D = WICDdsDimension($1);
  WICDdsTexture3D = WICDdsDimension($2);
  WICDdsTextureCube = WICDdsDimension($3);


  //=========================================================================*\
  //  WICDdsAlphaMode
  //=========================================================================*/
type
  PWICDdsAlphaMode = ^WICDdsAlphaMode;
  WICDdsAlphaMode = DWord;

const
  WICDdsAlphaModeUnknown = WICDdsAlphaMode(0);
  WICDdsAlphaModeStraight = WICDdsAlphaMode($1);
  WICDdsAlphaModePremultiplied = WICDdsAlphaMode($2);
  WICDdsAlphaModeOpaque = WICDdsAlphaMode($3);
  WICDdsAlphaModeCustom = WICDdsAlphaMode($4);


  // =============================================================================


type

  PREFWICPixelFormatGUID = ^REFWICPixelFormatGUID;
  REFWICPixelFormatGUID = TGUID;

  PWICPixelFormatGUID = ^WICPixelFormatGUID;
  WICPixelFormatGUID = TGUID;


  //* Forward Interface Declarations *//

  PIWICPalette = ^IWICPalette;
  IWICPalette = interface;

  PIWICBitmapSource = ^IWICBitmapSource;
  IWICBitmapSource = interface;

  PIWICFormatConverter = ^IWICFormatConverter;
  IWICFormatConverter = interface;

  PIWICPlanarFormatConverter = ^IWICPlanarFormatConverter;
  IWICPlanarFormatConverter = interface;

  PIWICBitmapScaler = ^IWICBitmapScaler;
  IWICBitmapScaler = interface;

  PIWICBitmapClipper = ^IWICBitmapClipper;
  IWICBitmapClipper = interface;

  PIWICBitmapFlipRotator = ^IWICBitmapFlipRotator;
  IWICBitmapFlipRotator = interface;

  { 10.0.28000.0  }
  PIWICBitmapToneMapper = ^IWICBitmapToneMapper;
  IWICBitmapToneMapper = interface;

  PIWICBitmapLock = ^IWICBitmapLock;
  IWICBitmapLock = interface;

  PIWICBitmap = ^IWICBitmap;
  IWICBitmap = interface;

  PIWICColorContext = ^IWICColorContext;
  IWICColorContext = interface;

  PIWICColorTransform = ^IWICColorTransform;
  IWICColorTransform = interface;

  PIWICFastMetadataEncoder = ^IWICFastMetadataEncoder;
  IWICFastMetadataEncoder = interface;

  PIWICStream = ^IWICStream;
  IWICStream = interface;

  PIWICEnumMetadataItem = ^IWICEnumMetadataItem;
  IWICEnumMetadataItem = interface;

  PIWICMetadataQueryReader = ^IWICMetadataQueryReader;
  IWICMetadataQueryReader = interface;

  PIWICMetadataQueryWriter = ^IWICMetadataQueryWriter;
  IWICMetadataQueryWriter = interface;

  PIWICBitmapEncoder = ^IWICBitmapEncoder;
  IWICBitmapEncoder = interface;

  PIWICBitmapFrameEncode = ^IWICBitmapFrameEncode;
  IWICBitmapFrameEncode = interface;

  PIWICPlanarBitmapFrameEncode = ^IWICPlanarBitmapFrameEncode;
  IWICPlanarBitmapFrameEncode = interface;

  PIWICImageEncoder = ^IWICImageEncoder;
  IWICImageEncoder = interface;

  PIWICBitmapDecoder = ^IWICBitmapDecoder;
  IWICBitmapDecoder = interface;

  PIWICBitmapSourceTransform = ^IWICBitmapSourceTransform;
  IWICBitmapSourceTransform = interface;

  PIWICPlanarBitmapSourceTransform = ^IWICPlanarBitmapSourceTransform;
  IWICPlanarBitmapSourceTransform = interface;

  PIWICBitmapFrameDecode = ^IWICBitmapFrameDecode;
  IWICBitmapFrameDecode = interface;

  PIWICProgressiveLevelControl = ^IWICProgressiveLevelControl;
  IWICProgressiveLevelControl = interface;

  PIWICDisplayAdaptationControl = ^IWICDisplayAdaptationControl;
  IWICDisplayAdaptationControl = interface;

  PIWICDisplayAdaptationControl2 = ^IWICDisplayAdaptationControl2;
  IWICDisplayAdaptationControl2 = interface;

  { 10.0.28000.0  }
  PIWICD3DTextureSource = ^IWICD3DTextureSource;
  IWICD3DTextureSource = interface;

  PIWICProgressCallback = ^IWICProgressCallback;
  IWICProgressCallback = interface;

  PIWICBitmapCodecProgressNotification = ^IWICBitmapCodecProgressNotification;
  IWICBitmapCodecProgressNotification = interface;

  PIWICComponentInfo = ^IWICComponentInfo;
  IWICComponentInfo = interface;

  PIWICFormatConverterInfo = ^IWICFormatConverterInfo;
  IWICFormatConverterInfo = interface;

  PIWICBitmapCodecInfo = ^IWICBitmapCodecInfo;
  IWICBitmapCodecInfo = interface;

  PIWICBitmapEncoderInfo = ^IWICBitmapEncoderInfo;
  IWICBitmapEncoderInfo = interface;

  PIWICBitmapDecoderInfo = ^IWICBitmapDecoderInfo;
  IWICBitmapDecoderInfo = interface;

  PIWICPixelFormatInfo = ^IWICPixelFormatInfo;
  IWICPixelFormatInfo = interface;

  PIWICPixelFormatInfo2 = ^IWICPixelFormatInfo2;
  IWICPixelFormatInfo2 = interface;

  PIWICImagingFactory = ^IWICImagingFactory;
  IWICImagingFactory = interface;

  PIWICImagingFactory2 = ^IWICImagingFactory2;
  IWICImagingFactory2 = interface;

  { 10.0.28000.0  }
  PIWICImagingFactory3 = ^IWICImagingFactory3;
  IWICImagingFactory3 = interface;


  D2D1_PIXEL_FORMAT = WinApi.DirectX.DCommon.D2D1_PIXEL_FORMAT;

  PWICColor = ^WICColor;
  WICColor = UINT32;

  PWICRect = ^WICRect;

  WICRect = record
    X: Integer;
    Y: Integer;
    Width: Integer;
    Height: Integer;
  end;


  WICInProcPointer = PByte;
  PWICInProcPointer = ^WICInProcPointer;


  PWICBitmapPattern = ^WICBitmapPattern;

  WICBitmapPattern = record
    Position: ULARGE_INTEGER;
    Length: ULONG;
    Pattern: PByte;
    { [size_is] }
    Mask: PByte;
    { [size_is] }
    EndOfStream: BOOL;
  end;


  //#if (_WIN32_WINNT >= _WIN32_WINNT_WIN8) or defined(_WIN7_PLATFORM_UPDATE)

  PWICImageParameters = ^WICImageParameters;

  WICImageParameters = record
    PixelFormat: D2D1_PIXEL_FORMAT;
    DpiX: Single;
    DpiY: Single;
    Top: Single;
    Left: Single;
    PixelWidth: UINT32;
    PixelHeight: UINT32;
  end;

  //#endif

  PWICBitmapPlaneDescription = ^WICBitmapPlaneDescription;

  WICBitmapPlaneDescription = record
    Format: WICPixelFormatGUID;
    Width: UINT;
    Height: UINT;
  end;

  PWICBitmapPlane = ^WICBitmapPlane;

  WICBitmapPlane = record
    Format: WICPixelFormatGUID;
    pbBuffer: PByte;
    { [size_is] }
    cbStride: UINT;
    cbBufferSize: UINT;
  end;

  PWICJpegFrameHeader = ^WICJpegFrameHeader;

  WICJpegFrameHeader = record
    Width: UINT;
    Height: UINT;
    TransferMatrix: WICJpegTransferMatrix;
    ScanType: WICJpegScanType;
    cComponents: UINT;
    { [range] }
    ComponentIdentifiers: DWORD;
    SampleFactors: DWORD;
    QuantizationTableIndices: DWORD;
  end;

  PWICJpegScanHeader = ^WICJpegScanHeader;

  WICJpegScanHeader = record
    cComponents: UINT;
    { [range] }
    RestartInterval: UINT;
    ComponentSelectors: DWORD;
    HuffmanTableIndices: DWORD;
    StartSpectralSelection: Byte;
    EndSpectralSelection: Byte;
    SuccessiveApproximationHigh: Byte;
    SuccessiveApproximationLow: Byte;
  end;



  // Interface IWICPalette
  // =====================
  //
  IWICPalette = interface(IUnknown)
    ['{00000040-a8f2-4877-ba0a-fd2b6645fb94}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function InitializePredefined(ePaletteType: WICBitmapPaletteType;
                                  fAddTransparentColor: BOOL): HRESULT; stdcall;

    function InitializeCustom(pColors: PWICColor;
                              cCount: UINT): HRESULT; stdcall;

    function InitializeFromBitmap(pISurface: IWICBitmapSource;
                                  cCount: UINT;
                                  fAddTransparentColor: BOOL): HRESULT; stdcall;

    function InitializeFromPalette(pIPalette: IWICPalette): HRESULT; stdcall;

    function GetType(pePaletteType: PWICBitmapPaletteType): HRESULT; stdcall;

    function GetColorCount(pcCount: PUINT): HRESULT; stdcall;

    function GetColors(cCount: UINT;
                       pColors: PWICColor;
                       pcActualColors: PUINT): HRESULT; stdcall;

    function IsBlackWhite(pfIsBlackWhite: PBOOL): HRESULT; stdcall;

    function IsGrayscale(pfIsGrayscale: PBOOL): HRESULT; stdcall;

    function HasAlpha(pfHasAlpha: PBOOL): HRESULT; stdcall;
  end;

  IID_IWICPalette = IWICPalette;



  // Interface IWICBitmapSource
  // ==========================
  //
  IWICBitmapSource = interface(IUnknown)
    ['{00000120-a8f2-4877-ba0a-fd2b6645fb94}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetSize(puiWidth: PUINT;
                     puiHeight: PUINT): HRESULT; stdcall;

    function GetPixelFormat(pPixelFormat: PWICPixelFormatGUID): HRESULT; stdcall;

    function GetResolution(pDpiX: PDouble;
                           pDpiY: PDouble): HRESULT; stdcall;

    function CopyPalette(pIPalette: IWICPalette): HRESULT; stdcall;

    function CopyPixels(prc: PWICRect;
                        cbStride: UINT;
                        cbBufferSize: UINT;
                        pbBuffer: PByte): HRESULT; stdcall;
  end;

  IID_IWICBitmapSource = IWICBitmapSource;



  // Interface IWICFormatConverter
  // =============================
  //
  IWICFormatConverter = interface(IWICBitmapSource)
    ['{00000301-a8f2-4877-ba0a-fd2b6645fb94}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function Initialize(pISource: IWICBitmapSource;
                        const dstFormat: WICPixelFormatGUID;
                        dither: WICBitmapDitherType;
                        pIPalette: IWICPalette;
                        alphaThresholdPercent: Double;
                        paletteTranslate: WICBitmapPaletteType): HRESULT; stdcall;

    function CanConvert(const srcPixelFormat: WICPixelFormatGUID;
                        const dstPixelFormat: WICPixelFormatGUID;
                        pfCanConvert: PBOOL): HRESULT; stdcall;
  end;

  IID_IWICFormatConverter = IWICFormatConverter;



  // Interface IWICPlanarFormatConverter
  // ===================================
  //
  IWICPlanarFormatConverter = interface(IWICBitmapSource)
    ['{BEBEE9CB-83B0-4DCC-8132-B0AAA55EAC96}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function Initialize(ppPlanes: PIWICBitmapSource;
                        cPlanes: UINT;
                        const dstFormat: WICPixelFormatGUID;
                        dither: WICBitmapDitherType;
                        pIPalette: IWICPalette;
                        alphaThresholdPercent: Double;
                        paletteTranslate: WICBitmapPaletteType): HRESULT; stdcall;

    function CanConvert(pSrcPixelFormats: PWICPixelFormatGUID;
                        cSrcPlanes: UINT;
                        const dstPixelFormat: WICPixelFormatGUID;
                        pfCanConvert: PBOOL): HRESULT; stdcall;
  end;

  IID_IWICPlanarFormatConverter = IWICPlanarFormatConverter;



  // Interface IWICBitmapScaler
  // ==========================
  //
  IWICBitmapScaler = interface(IWICBitmapSource)
    ['{00000302-a8f2-4877-ba0a-fd2b6645fb94}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function Initialize(pISource: IWICBitmapSource;
                        uiWidth: UINT;
                        uiHeight: UINT;
                        mode: WICBitmapInterpolationMode): HRESULT; stdcall;
  end;

  IID_IWICBitmapScaler = IWICBitmapScaler;



  // Interface IWICBitmapClipper
  // ===========================
  //
  IWICBitmapClipper = interface(IWICBitmapSource)
    ['{E4FBCF03-223D-4e81-9333-D635556DD1B5}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function Initialize(pISource: IWICBitmapSource;
                        prc: PWICRect): HRESULT; stdcall;
  end;

  IID_IWICBitmapClipper = IWICBitmapClipper;



  // Interface IWICBitmapFlipRotator
  // ===============================
  //
  IWICBitmapFlipRotator = interface(IWICBitmapSource)
    ['{5009834F-2D6A-41ce-9E1B-17C5AFF7A782}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function Initialize(pISource: IWICBitmapSource;
                        options: WICBitmapTransformOptions): HRESULT; stdcall;
  end;

  IID_IWICBitmapFlipRotator = IWICBitmapFlipRotator;

  { 10.0.28000.0  }
  // Interface IWICBitmapToneMapper
  // ===============================
  IWICBitmapToneMapper = interface(IWICBitmapSource)
    ['{44728ded-1edf-4fe9-b50b-c89a264c9439}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function InitializeForHdrTarget(pISource: IWICBitmapSource;
                                    const guidDstFormat: WICPixelFormatGUID;
                                    fLuminanceInNits: Single;
                                    fWhiteLevelInNits: Single;
                                    mode: WICBitmapToneMappingMode): HRESULT; stdcall;

    function InitializeForSdrTarget(pISource: IWICBitmapSource;
                                    const guidDstFormat: WICPixelFormatGUID;
                                    mode: WICBitmapToneMappingMode): HRESULT; stdcall;
  end;

  IID_IWICBitmapToneMapper = IWICBitmapToneMapper;



  // Interface IWICBitmapLock
  // ========================
  //
  IWICBitmapLock = interface(IUnknown)
    ['{00000123-a8f2-4877-ba0a-fd2b6645fb94}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetSize(puiWidth: PUINT;
                     puiHeight: PUINT): HRESULT; stdcall;

    function GetStride(pcbStride: PUINT): HRESULT; stdcall;

    function GetDataPointer(pcbBufferSize: PUINT;
                            ppbData: PWICInProcPointer): HRESULT; stdcall;

    function GetPixelFormat(pPixelFormat: PWICPixelFormatGUID): HRESULT; stdcall;
  end;

  IID_IWICBitmapLock = IWICBitmapLock;



  // Interface IWICBitmap
  // ====================
  //
  IWICBitmap = interface(IWICBitmapSource)
    ['{00000121-a8f2-4877-ba0a-fd2b6645fb94}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function Lock(prcLock: PWICRect;
                  flags: DWORD;
                  out ppILock: IWICBitmapLock): HRESULT; stdcall;

    function SetPalette(pIPalette: IWICPalette): HRESULT; stdcall;

    function SetResolution(dpiX: Double;
                           dpiY: Double): HRESULT; stdcall;
  end;

  IID_IWICBitmap = IWICBitmap;



  // Interface IWICColorContext
  // ==========================
  //
  IWICColorContext = interface(IUnknown)
    ['{3C613A02-34B2-44ea-9A7C-45AEA9C6FD6D}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function InitializeFromFilename(wzFilename: PWideChar): HRESULT; stdcall;

    function InitializeFromMemory(pbBuffer: PByte;
                                  cbBufferSize: UINT): HRESULT; stdcall;

    function InitializeFromExifColorSpace(value: UINT): HRESULT; stdcall;

    function GetType(pType: PWICColorContextType): HRESULT; stdcall;

    function GetProfileBytes(cbBuffer: UINT;
                             pbBuffer: PByte;
                             pcbActual: PUINT): HRESULT; stdcall;

    function GetExifColorSpace(pValue: PUINT): HRESULT; stdcall;
  end;

  IID_IWICColorContext = IWICColorContext;



  // Interface IWICColorTransform
  // ============================
  //
  IWICColorTransform = interface(IWICBitmapSource)
    ['{B66F034F-D0E2-40ab-B436-6DE39E321A94}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function Initialize(pIBitmapSource: IWICBitmapSource;
                        pIContextSource: IWICColorContext;
                        pIContextDest: IWICColorContext;
                        const pixelFmtDest: WICPixelFormatGUID): HRESULT; stdcall;
  end;

  IID_IWICColorTransform = IWICColorTransform;



  // Interface IWICFastMetadataEncoder
  // =================================
  //
  IWICFastMetadataEncoder = interface(IUnknown)
    ['{B84E2C09-78C9-4AC4-8BD3-524AE1663A2F}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function Commit(): HRESULT; stdcall;

    function GetMetadataQueryWriter(out ppIMetadataQueryWriter: IWICMetadataQueryWriter): HRESULT; stdcall;
  end;

  IID_IWICFastMetadataEncoder = IWICFastMetadataEncoder;



  // Interface IWICStream
  // ====================
  //
  IWICStream = interface(IStream)
    ['{135FF860-22B7-4ddf-B0F6-218F4F299A43}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function InitializeFromIStream(pIStream: IStream): HRESULT; stdcall;

    function InitializeFromFilename(wzFileName: PWideChar;
                                    dwDesiredAccess: DWORD): HRESULT; stdcall;

    function InitializeFromMemory(pbBuffer: WICInProcPointer;
                                  cbBufferSize: DWORD): HRESULT; stdcall;

    function InitializeFromIStreamRegion(pIStream: IStream;
                                         ulOffset: ULARGE_INTEGER;
                                         ulMaxSize: ULARGE_INTEGER): HRESULT; stdcall;
  end;

  IID_IWICStream = IWICStream;



  // Interface IWICEnumMetadataItem
  // ==============================
  //
  IWICEnumMetadataItem = interface(IUnknown)
    ['{DC2BB46D-3F07-481E-8625-220C4AEDBB33}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function Next(celt: ULONG;
                  rgeltSchema: PPROPVARIANT;
                  rgeltId: PPROPVARIANT;
                  rgeltValue: PPROPVARIANT;
                  pceltFetched: PULONG): HRESULT; stdcall;

    function Skip(celt: ULONG): HRESULT; stdcall;

    function Reset(): HRESULT; stdcall;

    function Clone(out ppIEnumMetadataItem: IWICEnumMetadataItem): HRESULT; stdcall;
  end;

  IID_IWICEnumMetadataItem = IWICEnumMetadataItem;



  // Interface IWICMetadataQueryReader
  // =================================
  //
  IWICMetadataQueryReader = interface(IUnknown)
    ['{30989668-E1C9-4597-B395-458EEDB808DF}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetContainerFormat(pguidContainerFormat: PGUID): HRESULT; stdcall;

    function GetLocation(cchMaxLength: UINT;
                         wzNamespace: PWideChar;
                         pcchActualLength: PUINT): HRESULT; stdcall;

    function GetMetadataByName(wzName: PWideChar;
                               pvarValue: PPROPVARIANT): HRESULT; stdcall;

    function GetEnumerator(out ppIEnumString: IEnumString): HRESULT; stdcall;
  end;

  IID_IWICMetadataQueryReader = IWICMetadataQueryReader;



  // Interface IWICMetadataQueryWriter
  // =================================
  //
  IWICMetadataQueryWriter = interface(IWICMetadataQueryReader)
    ['{A721791A-0DEF-4d06-BD91-2118BF1DB10B}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function SetMetadataByName(wzName: PWideChar;
                               pvarValue: PPROPVARIANT): HRESULT; stdcall;

    function RemoveMetadataByName(wzName: PWideChar): HRESULT; stdcall;
  end;

  IID_IWICMetadataQueryWriter = IWICMetadataQueryWriter;



  // Interface IWICBitmapEncoder
  // ===========================
  //
  IWICBitmapEncoder = interface(IUnknown)
    ['{00000103-a8f2-4877-ba0a-fd2b6645fb94}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function Initialize(pIStream: IStream;
                        cacheOption: WICBitmapEncoderCacheOption): HRESULT; stdcall;

    function GetContainerFormat(pguidContainerFormat: PGUID): HRESULT; stdcall;

    function GetEncoderInfo(out ppIEncoderInfo: IWICBitmapEncoderInfo): HRESULT; stdcall;

    function SetColorContexts(cCount: UINT;
                              ppIColorContext: PIWICColorContext): HRESULT; stdcall;

    function SetPalette(pIPalette: IWICPalette): HRESULT; stdcall;

    function SetThumbnail(pIThumbnail: IWICBitmapSource): HRESULT; stdcall;

    function SetPreview(pIPreview: IWICBitmapSource): HRESULT; stdcall;

    function CreateNewFrame(out ppIFrameEncode: IWICBitmapFrameEncode;
                            out ppIEncoderOptions: IPropertyBag2): HRESULT; stdcall;

    function Commit(): HRESULT; stdcall;

    function GetMetadataQueryWriter(out ppIMetadataQueryWriter: IWICMetadataQueryWriter): HRESULT; stdcall;
  end;

  IID_IWICBitmapEncoder = IWICBitmapEncoder;


  // Interface IWICBitmapFrameEncode
  // ===============================
  //
  IWICBitmapFrameEncode = interface(IUnknown)
    ['{00000105-a8f2-4877-ba0a-fd2b6645fb94}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function Initialize(pIEncoderOptions: IPropertyBag2): HRESULT; stdcall;

    function SetSize(uiWidth: UINT;
                     uiHeight: UINT): HRESULT; stdcall;

    function SetResolution(dpiX: Double;
                           dpiY: Double): HRESULT; stdcall;

    function SetPixelFormat(pPixelFormat: PWICPixelFormatGUID): HRESULT; stdcall;

    function SetColorContexts(cCount: UINT;
                              ppIColorContext: PIWICColorContext): HRESULT; stdcall;

    function SetPalette(pIPalette: IWICPalette): HRESULT; stdcall;

    function SetThumbnail(pIThumbnail: IWICBitmapSource): HRESULT; stdcall;

    function WritePixels(lineCount: UINT;
                         cbStride: UINT;
                         cbBufferSize: UINT;
                         pbPixels: PByte): HRESULT; stdcall;

    function WriteSource(pIBitmapSource: IWICBitmapSource;
                         prc: PWICRect): HRESULT; stdcall;

    function Commit(): HRESULT; stdcall;

    function GetMetadataQueryWriter(out ppIMetadataQueryWriter: IWICMetadataQueryWriter): HRESULT; stdcall;
  end;

  IID_IWICBitmapFrameEncode = IWICBitmapFrameEncode;



  // Interface IWICPlanarBitmapFrameEncode
  // =====================================
  //
  IWICPlanarBitmapFrameEncode = interface(IUnknown)
    ['{F928B7B8-2221-40C1-B72E-7E82F1974D1A}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function WritePixels(lineCount: UINT;
                         pPlanes: PWICBitmapPlane;
                         cPlanes: UINT): HRESULT; stdcall;

    function WriteSource(ppPlanes: PIWICBitmapSource;
                         cPlanes: UINT;
                         prcSource: PWICRect): HRESULT; stdcall;
  end;

  IID_IWICPlanarBitmapFrameEncode = IWICPlanarBitmapFrameEncode;


  // #if (_WIN32_WINNT >= _WIN32_WINNT_WIN8) || defined(_WIN7_PLATFORM_UPDATE)

  // Interface IWICImageEncoder
  // ==========================
  //
  IWICImageEncoder = interface(IUnknown)
    ['{04C75BF8-3CE1-473B-ACC5-3CC4F5E94999}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    // Direct2D input pointers are borrowed; full Direct2D declarations remain pending.
    function WriteFrame(pImage: Pointer;
                        pFrameEncode: IWICBitmapFrameEncode;
                        pImageParameters: PWICImageParameters): HRESULT; stdcall;

    function WriteFrameThumbnail(pImage: Pointer;
                                 pFrameEncode: IWICBitmapFrameEncode;
                                 pImageParameters: PWICImageParameters): HRESULT; stdcall;

    function WriteThumbnail(pImage: Pointer;
                            pEncoder: IWICBitmapEncoder;
                            pImageParameters: PWICImageParameters): HRESULT; stdcall;
  end;

  IID_IWICImageEncoder = IWICImageEncoder;



  // Interface IWICBitmapDecoder
  // ===========================
  //
  IWICBitmapDecoder = interface(IUnknown)
    ['{9EDDE9E7-8DEE-47ea-99DF-E6FAF2ED44BF}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function QueryCapability(pIStream: IStream;
                             pdwCapability: PDWORD): HRESULT; stdcall;

    function Initialize(pIStream: IStream;
                        cacheOptions: WICDecodeOptions): HRESULT; stdcall;

    function GetContainerFormat(pguidContainerFormat: PGUID): HRESULT; stdcall;

    function GetDecoderInfo(out ppIDecoderInfo: IWICBitmapDecoderInfo): HRESULT; stdcall;

    function CopyPalette(pIPalette: IWICPalette): HRESULT; stdcall;

    function GetMetadataQueryReader(out ppIMetadataQueryReader: IWICMetadataQueryReader): HRESULT; stdcall;

    function GetPreview(out ppIBitmapSource: IWICBitmapSource): HRESULT; stdcall;

    function GetColorContexts(cCount: UINT;
                              ppIColorContexts: PIWICColorContext;
                              pcActualCount: PUINT): HRESULT; stdcall;

    function GetThumbnail(out ppIThumbnail: IWICBitmapSource): HRESULT; stdcall;

    function GetFrameCount(pCount: PUINT): HRESULT; stdcall;

    function GetFrame(index: UINT;
                      out ppIBitmapFrame: IWICBitmapFrameDecode): HRESULT; stdcall;
  end;

  IID_IWICBitmapDecoder = IWICBitmapDecoder;



  // Interface IWICBitmapSourceTransform
  // ===================================
  //
  IWICBitmapSourceTransform = interface(IUnknown)
    ['{3B16811B-6A43-4ec9-B713-3D5A0C13B940}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function CopyPixels(prc: PWICRect;
                        uiWidth: UINT;
                        uiHeight: UINT;
                        pguidDstFormat: PWICPixelFormatGUID;
                        dstTransform: WICBitmapTransformOptions;
                        nStride: UINT;
                        cbBufferSize: UINT;
                        pbBuffer: PByte): HRESULT; stdcall;

    function GetClosestSize(puiWidth: PUINT;
                            puiHeight: PUINT): HRESULT; stdcall;

    function GetClosestPixelFormat(pguidDstFormat: PWICPixelFormatGUID): HRESULT; stdcall;

    function DoesSupportTransform(dstTransform: WICBitmapTransformOptions;
                                  pfIsSupported: PBOOL): HRESULT; stdcall;
  end;

  IID_IWICBitmapSourceTransform = IWICBitmapSourceTransform;



  // Interface IWICPlanarBitmapSourceTransform
  // =========================================
  //
  IWICPlanarBitmapSourceTransform = interface(IUnknown)
    ['{3AFF9CCE-BE95-4303-B927-E7D16FF4A613}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function DoesSupportTransform(puiWidth: PUINT;
                                  puiHeight: PUINT;
                                  dstTransform: WICBitmapTransformOptions;
                                  dstPlanarOptions: WICPlanarOptions;
                                  pguidDstFormats: PWICPixelFormatGUID;
                                  pPlaneDescriptions: PWICBitmapPlaneDescription;
                                  cPlanes: UINT;
                                  pfIsSupported: PBOOL): HRESULT; stdcall;

    function CopyPixels(prcSource: PWICRect;
                        uiWidth: UINT;
                        uiHeight: UINT;
                        dstTransform: WICBitmapTransformOptions;
                        dstPlanarOptions: WICPlanarOptions;
                        pDstPlanes: PWICBitmapPlane;
                        cPlanes: UINT): HRESULT; stdcall;
  end;

  IID_IWICPlanarBitmapSourceTransform = IWICPlanarBitmapSourceTransform;



  // Interface IWICBitmapFrameDecode
  // ===============================
  //
  IWICBitmapFrameDecode = interface(IWICBitmapSource)
    ['{3B16811B-6A43-4ec9-A813-3D930C13B940}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetMetadataQueryReader(out ppIMetadataQueryReader: IWICMetadataQueryReader): HRESULT; stdcall;

    function GetColorContexts(cCount: UINT;
                              ppIColorContexts: PIWICColorContext;
                              pcActualCount: PUINT): HRESULT; stdcall;

    function GetThumbnail(out ppIThumbnail: IWICBitmapSource): HRESULT; stdcall;
  end;

  IID_IWICBitmapFrameDecode = IWICBitmapFrameDecode;


  // Interface IWICBitmapFrameChainReader
  // ====================================
  // Provides access to frames that are linked
  // to the current frame through chains of different types.
  //
  IWICBitmapFrameChainReader = interface(IUnknown)
    ['{0c599495-a120-4222-9130-a8c29410bd0b}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetChainedFrameCount(chainType: WICBitmapChainType;
                                  pCount: PUINT): HRESULT; stdcall;

    function GetChainedFrame(chainType: WICBitmapChainType;
                             index: UINT;
                             out ppIBitmapFrame: IWICBitmapFrameDecode): HRESULT; stdcall;
  end;

  IID_IWICBitmapFrameChainReader = IWICBitmapFrameChainReader;


  // Interface IWICBitmapFrameChainWriter
  // ====================================
  // Link frames together in chains of different types.
  //
  IWICBitmapFrameChainWriter = interface(IUnknown)
    ['{40d9ea28-4768-47b3-8c12-558a48e98e38}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function AppendFrameToChain(chainType: WICBitmapChainType;
                                out ppIFrameEncode: IWICBitmapFrameEncode;
                                out ppIEncoderOptions: IPropertyBag2): HRESULT; stdcall;

    function DoesSupportChainType(chainType: WICBitmapChainType;
                                  pfIsSupported: PBOOL): HRESULT; stdcall;
  end;

  IID_IWICBitmapFrameChainWriter = IWICBitmapFrameChainWriter;


  // Interface IWICProgressiveLevelControl
  // =====================================
  //
  IWICProgressiveLevelControl = interface(IUnknown)
    ['{DAAC296F-7AA5-4dbf-8D15-225C5976F891}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetLevelCount(pcLevels: PUINT): HRESULT; stdcall;

    function GetCurrentLevel(pnLevel: PUINT): HRESULT; stdcall;

    function SetCurrentLevel(nLevel: UINT): HRESULT; stdcall;
  end;

  IID_IWICProgressiveLevelControl = IWICProgressiveLevelControl;



  // Interface IWICDisplayAdaptationControl
  // ======================================
  // For adapting decoding to capabilities of the display.
  //
  IWICDisplayAdaptationControl = interface(IUnknown)
    ['{de9d91d2-70b4-4f41-836c-25fcd39626d3}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function DoesSupportChangingMaxLuminance(pguidDstFormat: PWICPixelFormatGUID;
                                             pfIsSupported: PBOOL): HRESULT; stdcall;

    function SetDisplayMaxLuminance(fLuminanceInNits: Single): HRESULT; stdcall;

    function GetDisplayMaxLuminance(pfLuminanceInNits: PSingle): HRESULT; stdcall;
  end;

  IID_IWICDisplayAdaptationControl = IWICDisplayAdaptationControl;


  // Interface IWICProgressiveLevelControl2
  // ======================================
  // For adapting decoding to capabilities of the display.
  // Extends IWICDisplayAdaptationControl with additional methods.
  //
  IWICDisplayAdaptationControl2 = interface(IWICDisplayAdaptationControl)
    ['{d7508d29-3ab7-447e-a676-4d80d7de726b}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function SetSdrWhiteLevel(fWhiteLevelInNits: Single): HRESULT; stdcall;

    function GetSdrWhiteLevel(pfWhiteLevelInNits: PSingle): HRESULT; stdcall;

    function SetToneMappingMode(mode: WICBitmapToneMappingMode): HRESULT; stdcall;

    function GetToneMappingMode(mode: PWICBitmapToneMappingMode): HRESULT; stdcall;

    function DoesSupportToneMappingMode(mode: WICBitmapToneMappingMode;
                                        pfIsSupported: PBOOL): HRESULT; stdcall;
  end;

  IID_IWICDisplayAdaptationControl2 = IWICDisplayAdaptationControl2;

  { 10.0.28000.0  }
  // Interface IWICD3DTextureSource
  // ===============================
  IWICD3DTextureSource = interface(IUnknown)
    ['{caf65cc4-8ebe-4718-a21f-8dbf40bb7e25}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetTexture(pD3DDevice: IUnknown;
                        pID3DTextureOptions: IPropertyBag2;
                        const riid: TGUID;
                        out ppTexture: Pointer): HRESULT; stdcall;

    function GetTransformedTexture(prc: PWICRect;
                                   uiWidth: UINT;
                                   uiHeight: UINT;
                                   pguidDstFormat: PWICPixelFormatGUID;
                                   dstTransform: WICBitmapTransformOptions;
                                   pD3DDevice: IUnknown;
                                   pID3DTextureOptions: IPropertyBag2;
                                   const riid: TGUID;
                                   out ppTexture: Pointer): HRESULT; stdcall;

    function DoesSupportD3DDeviceType(const riid: TGUID;
                                      pfIsSupported: PBOOL): HRESULT; stdcall;

    function GetD3DTextureOptions(out ppID3DTextureOptions: IPropertyBag2): HRESULT; stdcall;
  end;

  IID_IWICD3DTextureSource = IWICD3DTextureSource;



  // Interface IWICProgressCallback
  // ==============================
  //
  IWICProgressCallback = interface(IUnknown)
    ['{4776F9CD-9517-45FA-BF24-E89C5EC5C60C}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function Notify(uFrameNum: ULONG;
                    operation: WICProgressOperation;
                    dblProgress: Double): HRESULT; stdcall;
  end;

  IID_IWICProgressCallback = IWICProgressCallback;


  // Belongs to interface IWICBitmapCodecProgressNotification
  // Application defined callback function called when codec component progress is made.
  FNProgressNotification = function(pvData: Pointer;
                                    uFrameNum: ULONG;
                                    operation: WICProgressOperation;
                                    dblProgress: Double): HResult; stdcall;


  // Interface IWICBitmapCodecProgressNotification
  // =============================================
  //
  IWICBitmapCodecProgressNotification = interface(IUnknown)
    ['{64C1024E-C3CF-4462-8078-88C2B11C46D9}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function RegisterProgressNotification(pfnProgressNotification: FNProgressNotification;
                                          pvData: Pointer;
                                          dwProgressFlags: DWORD): HRESULT; stdcall;
  end;

  IID_IWICBitmapCodecProgressNotification = IWICBitmapCodecProgressNotification;



  // Interface IWICComponentInfo
  // ===========================
  //
  IWICComponentInfo = interface(IUnknown)
    ['{23BC3F0A-698B-4357-886B-F24D50671334}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetComponentType(pType: PWICComponentType): HRESULT; stdcall;

    function GetCLSID(pclsid: PGUID): HRESULT; stdcall;

    function GetSigningStatus(pStatus: PDWORD): HRESULT; stdcall;

    function GetAuthor(cchAuthor: UINT;
                       wzAuthor: PWideChar;
                       pcchActual: PUINT): HRESULT; stdcall;

    function GetVendorGUID(pguidVendor: PGUID): HRESULT; stdcall;

    function GetVersion(cchVersion: UINT;
                        wzVersion: PWideChar;
                        pcchActual: PUINT): HRESULT; stdcall;

    function GetSpecVersion(cchSpecVersion: UINT;
                            wzSpecVersion: PWideChar;
                            pcchActual: PUINT): HRESULT; stdcall;

    function GetFriendlyName(cchFriendlyName: UINT;
                             wzFriendlyName: PWideChar;
                             pcchActual: PUINT): HRESULT; stdcall;
  end;

  IID_IWICComponentInfo = IWICComponentInfo;



  // Interface IWICFormatConverterInfo
  // =================================
  //
  IWICFormatConverterInfo = interface(IWICComponentInfo)
    ['{9F34FB65-13F4-4f15-BC57-3726B5E53D9F}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetPixelFormats(cFormats: UINT;
                             pPixelFormatGUIDs: PWICPixelFormatGUID;
                             pcActual: PUINT): HRESULT; stdcall;

    function CreateInstance(out ppIConverter: IWICFormatConverter): HRESULT; stdcall;
  end;

  IID_IWICFormatConverterInfo = IWICFormatConverterInfo;



  // Interface IWICBitmapCodecInfo
  // =============================
  //
  IWICBitmapCodecInfo = interface(IWICComponentInfo)
    ['{E87A44C4-B76E-4c47-8B09-298EB12A2714}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetContainerFormat(pguidContainerFormat: PGUID): HRESULT; stdcall;

    function GetPixelFormats(cFormats: UINT;
                             pguidPixelFormats: PGUID;
                             pcActual: PUINT): HRESULT; stdcall;

    function GetColorManagementVersion(cchColorManagementVersion: UINT;
                                       wzColorManagementVersion: PWideChar;
                                       pcchActual: PUINT): HRESULT; stdcall;

    function GetDeviceManufacturer(cchDeviceManufacturer: UINT;
                                   wzDeviceManufacturer: PWideChar;
                                   pcchActual: PUINT): HRESULT; stdcall;

    function GetDeviceModels(cchDeviceModels: UINT;
                             wzDeviceModels: PWideChar;
                             pcchActual: PUINT): HRESULT; stdcall;

    function GetMimeTypes(cchMimeTypes: UINT;
                          wzMimeTypes: PWideChar;
                          pcchActual: PUINT): HRESULT; stdcall;

    function GetFileExtensions(cchFileExtensions: UINT;
                               wzFileExtensions: PWideChar;
                               pcchActual: PUINT): HRESULT; stdcall;

    function DoesSupportAnimation(pfSupportAnimation: PBOOL): HRESULT; stdcall;

    function DoesSupportChromakey(pfSupportChromakey: PBOOL): HRESULT; stdcall;

    function DoesSupportLossless(pfSupportLossless: PBOOL): HRESULT; stdcall;

    function DoesSupportMultiframe(pfSupportMultiframe: PBOOL): HRESULT; stdcall;

    function MatchesMimeType(wzMimeType: PWideChar;
                             pfMatches: PBOOL): HRESULT; stdcall;
  end;

  IID_IWICBitmapCodecInfo = IWICBitmapCodecInfo;



  // Interface IWICBitmapEncoderInfo
  // ===============================
  //
  IWICBitmapEncoderInfo = interface(IWICBitmapCodecInfo)
    ['{94C9B4EE-A09F-4f92-8A1E-4A9BCE7E76FB}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function CreateInstance(out ppIBitmapEncoder: IWICBitmapEncoder): HRESULT; stdcall;
  end;

  IID_IWICBitmapEncoderInfo = IWICBitmapEncoderInfo;


  // Interface IWICBitmapDecoderInfo
  // ===============================
  //
  IWICBitmapDecoderInfo = interface(IWICBitmapCodecInfo)
    ['{D8CD007F-D08F-4191-9BFC-236EA7F0E4B5}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetPatterns(cbSizePatterns: UINT;
                         pPatterns: PWICBitmapPattern;
                         pcPatterns: PUINT;
                         pcbPatternsActual: PUINT): HRESULT; stdcall;

    function MatchesPattern(pIStream: IStream;
                            pfMatches: PBOOL): HRESULT; stdcall;

    function CreateInstance(out ppIBitmapDecoder: IWICBitmapDecoder): HRESULT; stdcall;
  end;

  IID_IWICBitmapDecoderInfo = IWICBitmapDecoderInfo;


  // Interface IWICPixelFormatInfo
  // =============================
  //
  IWICPixelFormatInfo = interface(IWICComponentInfo)
    ['{E8EDA601-3D48-431a-AB44-69059BE88BBE}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetFormatGUID(pFormat: PGUID): HRESULT; stdcall;

    function GetColorContext(out ppIColorContext: IWICColorContext): HRESULT; stdcall;

    function GetBitsPerPixel(puiBitsPerPixel: PUINT): HRESULT; stdcall;

    function GetChannelCount(puiChannelCount: PUINT): HRESULT; stdcall;

    function GetChannelMask(uiChannelIndex: UINT;
                            cbMaskBuffer: UINT;
                            pbMaskBuffer: PByte;
                            pcbActual: PUINT): HRESULT; stdcall;
  end;

  IID_IWICPixelFormatInfo = IWICPixelFormatInfo;


  // Interface IWICPixelFormatInfo2
  // ==============================
  //
  IWICPixelFormatInfo2 = interface(IWICPixelFormatInfo)
    ['{A9DB33A2-AF5F-43C7-B679-74F5984B5AA4}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function SupportsTransparency(pfSupportsTransparency: PBOOL): HRESULT; stdcall;

    function GetNumericRepresentation(pNumericRepresentation: PWICPixelFormatNumericRepresentation): HRESULT; stdcall;
  end;

  IID_IWICPixelFormatInfo2 = IWICPixelFormatInfo2;


  // Interface IWICImagingFactory
  // ============================
  //
  IWICImagingFactory = interface(IUnknown)
    ['{ec5ec8a9-c395-4314-9c77-54d7a935ff70}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function CreateDecoderFromFilename(wzFilename: PWideChar;
                                       pguidVendor: PGUID;
                                       dwDesiredAccess: DWORD;
                                       metadataOptions: WICDecodeOptions;
                                       out ppIDecoder: IWICBitmapDecoder): HRESULT; stdcall;

    function CreateDecoderFromStream(pIStream: IStream;
                                     pguidVendor: PGUID;
                                     metadataOptions: WICDecodeOptions;
                                     out ppIDecoder: IWICBitmapDecoder): HRESULT; stdcall;

    function CreateDecoderFromFileHandle(hFile: ULONG_PTR;
                                         pguidVendor: PGUID;
                                         metadataOptions: WICDecodeOptions;
                                         out ppIDecoder: IWICBitmapDecoder): HRESULT; stdcall;

    function CreateComponentInfo(const clsidComponent: TGUID;
                                 out ppIInfo: IWICComponentInfo): HRESULT; stdcall;

    function CreateDecoder(const guidContainerFormat: TGUID;
                           pguidVendor: PGUID;
                           out ppIDecoder: IWICBitmapDecoder): HRESULT; stdcall;

    function CreateEncoder(const guidContainerFormat: TGUID;
                           pguidVendor: PGUID;
                           out ppIEncoder: IWICBitmapEncoder): HRESULT; stdcall;

    function CreatePalette(out ppIPalette: IWICPalette): HRESULT; stdcall;

    function CreateFormatConverter(out ppIFormatConverter: IWICFormatConverter): HRESULT; stdcall;

    function CreateBitmapScaler(out ppIBitmapScaler: IWICBitmapScaler): HRESULT; stdcall;

    function CreateBitmapClipper(out ppIBitmapClipper: IWICBitmapClipper): HRESULT; stdcall;

    function CreateBitmapFlipRotator(out ppIBitmapFlipRotator: IWICBitmapFlipRotator): HRESULT; stdcall;

    function CreateStream(out ppIWICStream: IWICStream): HRESULT; stdcall;

    function CreateColorContext(out ppIWICColorContext: IWICColorContext): HRESULT; stdcall;

    function CreateColorTransformer(out ppIWICColorTransform: IWICColorTransform): HRESULT; stdcall;

    function CreateBitmap(uiWidth: UINT;
                          uiHeight: UINT;
                          const pixelFormat: WICPixelFormatGUID;
                          option: WICBitmapCreateCacheOption;
                          out ppIBitmap: IWICBitmap): HRESULT; stdcall;

    function CreateBitmapFromSource(pIBitmapSource: IWICBitmapSource;
                                    option: WICBitmapCreateCacheOption;
                                    out ppIBitmap: IWICBitmap): HRESULT; stdcall;

    function CreateBitmapFromSourceRect(pIBitmapSource: IWICBitmapSource;
                                        x: UINT;
                                        y: UINT;
                                        width: UINT;
                                        height: UINT;
                                        out ppIBitmap: IWICBitmap): HRESULT; stdcall;

    function CreateBitmapFromMemory(uiWidth: UINT;
                                    uiHeight: UINT;
                                    const pixelFormat: WICPixelFormatGUID;
                                    cbStride: UINT;
                                    cbBufferSize: UINT;
                                    pbBuffer: PByte;
                                    out ppIBitmap: IWICBitmap): HRESULT; stdcall;

    function CreateBitmapFromHBITMAP(hBitmap: HBITMAP;
                                     hPalette: HPALETTE;
                                     options: WICBitmapAlphaChannelOption;
                                     out ppIBitmap: IWICBitmap): HRESULT; stdcall;

    function CreateBitmapFromHICON(hIcon: HICON;
                                   out ppIBitmap: IWICBitmap): HRESULT; stdcall;

    function CreateComponentEnumerator(componentTypes: DWORD;
                                       options: DWORD;
                                       out ppIEnumUnknown: IEnumUnknown): HRESULT; stdcall;

    function CreateFastMetadataEncoderFromDecoder(pIDecoder: IWICBitmapDecoder;
                                                  out ppIFastEncoder: IWICFastMetadataEncoder): HRESULT; stdcall;

    function CreateFastMetadataEncoderFromFrameDecode(pIFrameDecoder: IWICBitmapFrameDecode;
                                                      out ppIFastEncoder: IWICFastMetadataEncoder): HRESULT; stdcall;

    function CreateQueryWriter(const guidMetadataFormat: TGUID;
                               pguidVendor: PGUID;
                               out ppIQueryWriter: IWICMetadataQueryWriter): HRESULT; stdcall;

    function CreateQueryWriterFromReader(pIQueryReader: IWICMetadataQueryReader;
                                         pguidVendor: PGUID;
                                         out ppIQueryWriter: IWICMetadataQueryWriter): HRESULT; stdcall;
  end;

  IID_IWICImagingFactory = IWICImagingFactory;


  //#if (_WIN32_WINNT >= _WIN32_WINNT_WIN8) || defined(_WIN7_PLATFORM_UPDATE)

  // Interface IWICImagingFactory2
  // =============================
  //
  IWICImagingFactory2 = interface(IWICImagingFactory)
    ['{7B816B45-1996-4476-B132-DE9E247C8AF0}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function CreateImageEncoder(pD2DDevice: Pointer;
                                out ppWICImageEncoder: IWICImageEncoder): HRESULT; stdcall;
  end;

  IID_IWICImagingFactory2 = IWICImagingFactory2;

  { 10.0.28000.0  }
  // Interface IWICImagingFactory3
  // =============================
  IWICImagingFactory3 = interface(IWICImagingFactory2)
    ['{489b3d8b-624a-4258-b678-7eece70f299d}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function CreateBitmapToneMapper(out ppToneMapper: IWICBitmapToneMapper): HRESULT; stdcall;
  end;

  IID_IWICImagingFactory3 = IWICImagingFactory3;



function WICConvertBitmapSource(const dstFormat: WICPixelFormatGUID;
                                pISrc: IWICBitmapSource;
                                out ppIDst: IWICBitmapSource): HRESULT; stdcall;


function WICCreateBitmapFromSection(width: UINT;
                                    height: UINT;
                                    const pixelFormat: WICPixelFormatGUID;
                                    hSection: THandle;
                                    stride: UINT;
                                    offset: UINT;
                                    out ppIBitmap: IWICBitmap): HRESULT; stdcall;


function WICCreateBitmapFromSectionEx(width: UINT;
                                      height: UINT;
                                      const pixelFormat: WICPixelFormatGUID;
                                      hSection: THandle;
                                      stride: UINT;
                                      offset: UINT;
                                      desiredAccessLevel: WICSectionAccessLevel;
                                      out ppIBitmap: IWICBitmap): HRESULT; stdcall;


function WICMapGuidToShortName(const guid: TGUID;
                               cchName: UINT;
                               wzName: PWideChar;
                               pcchActual: PUINT): HRESULT; stdcall;


function WICMapShortNameToGuid(wzName: PWideChar;
                               pguid: PGUID): HRESULT; stdcall;


function WICMapSchemaToName(const guidMetadataFormat: TGUID;
                            pwzSchema: PWideChar;
                            cchName: UINT;
                            wzName: PWideChar;
                            pcchActual: PUINT): HRESULT; stdcall;

type

  PIWICDevelopRawNotificationCallback = ^IWICDevelopRawNotificationCallback;
  IWICDevelopRawNotificationCallback = interface;

  PIWICDevelopRaw = ^IWICDevelopRaw;
  IWICDevelopRaw = interface;

  PIWICDdsDecoder = ^IWICDdsDecoder;
  IWICDdsDecoder = interface;

  PIWICDdsEncoder = ^IWICDdsEncoder;
  IWICDdsEncoder = interface;

  PIWICDdsFrameDecode = ^IWICDdsFrameDecode;
  IWICDdsFrameDecode = interface;

  PIWICJpegFrameDecode = ^IWICJpegFrameDecode;
  IWICJpegFrameDecode = interface;

  PIWICJpegFrameEncode = ^IWICJpegFrameEncode;
  IWICJpegFrameEncode = interface;



  // Interface IWICDevelopRawNotificationCallback
  // ============================================
  //
  IWICDevelopRawNotificationCallback = interface(IUnknown)
    ['{95c75a6e-3e8c-4ec2-85a8-aebcc551e59b}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function Notify(NotificationMask: UINT): HRESULT; stdcall;
  end;

  IID_IWICDevelopRawNotificationCallback = IWICDevelopRawNotificationCallback;


  // Interface IWICDevelopRaw
  // ========================
  //
  IWICDevelopRaw = interface(IWICBitmapFrameDecode)
    ['{fbec5e44-f7be-4b65-b7f8-c0c81fef026d}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function QueryRawCapabilitiesInfo(pInfo: PWICRawCapabilitiesInfo): HRESULT; stdcall;

    function LoadParameterSet(ParameterSet: WICRawParameterSet): HRESULT; stdcall;

    function GetCurrentParameterSet(out ppCurrentParameterSet: IPropertyBag2): HRESULT; stdcall;

    function SetExposureCompensation(ev: Double): HRESULT; stdcall;

    function GetExposureCompensation(pEV: PDouble): HRESULT; stdcall;

    function SetWhitePointRGB(Red: UINT;
                              Green: UINT;
                              Blue: UINT): HRESULT; stdcall;

    function GetWhitePointRGB(pRed: PUINT;
                              pGreen: PUINT;
                              pBlue: PUINT): HRESULT; stdcall;

    function SetNamedWhitePoint(WhitePoint: WICNamedWhitePoint): HRESULT; stdcall;

    function GetNamedWhitePoint(pWhitePoint: PWICNamedWhitePoint): HRESULT; stdcall;

    function SetWhitePointKelvin(WhitePointKelvin: UINT): HRESULT; stdcall;

    function GetWhitePointKelvin(pWhitePointKelvin: PUINT): HRESULT; stdcall;

    function GetKelvinRangeInfo(pMinKelvinTemp: PUINT;
                                pMaxKelvinTemp: PUINT;
                                pKelvinTempStepValue: PUINT): HRESULT; stdcall;

    function SetContrast(Contrast: Double): HRESULT; stdcall;

    function GetContrast(pContrast: PDouble): HRESULT; stdcall;

    function SetGamma(Gamma: Double): HRESULT; stdcall;

    function GetGamma(pGamma: PDouble): HRESULT; stdcall;

    function SetSharpness(Sharpness: Double): HRESULT; stdcall;

    function GetSharpness(pSharpness: PDouble): HRESULT; stdcall;

    function SetSaturation(Saturation: Double): HRESULT; stdcall;

    function GetSaturation(pSaturation: PDouble): HRESULT; stdcall;

    function SetTint(Tint: Double): HRESULT; stdcall;

    function GetTint(pTint: PDouble): HRESULT; stdcall;

    function SetNoiseReduction(NoiseReduction: Double): HRESULT; stdcall;

    function GetNoiseReduction(pNoiseReduction: PDouble): HRESULT; stdcall;

    function SetDestinationColorContext(pColorContext: IWICColorContext): HRESULT; stdcall;

    function SetToneCurve(cbToneCurveSize: UINT;
                          pToneCurve: PWICRawToneCurve): HRESULT; stdcall;

    function GetToneCurve(cbToneCurveBufferSize: UINT;
                          pToneCurve: PWICRawToneCurve;
                          pcbActualToneCurveBufferSize: PUINT): HRESULT; stdcall;

    function SetRotation(Rotation: Double): HRESULT; stdcall;

    function GetRotation(pRotation: PDouble): HRESULT; stdcall;

    function SetRenderMode(RenderMode: WICRawRenderMode): HRESULT; stdcall;

    function GetRenderMode(pRenderMode: PWICRawRenderMode): HRESULT; stdcall;

    function SetNotificationCallback(pCallback: IWICDevelopRawNotificationCallback): HRESULT; stdcall;
  end;

  IID_IWICDevelopRaw = IWICDevelopRaw;


  PWICDdsParameters = ^WICDdsParameters;

  WICDdsParameters = record
    Width: UINT;
    Height: UINT;
    Depth: UINT;
    MipLevels: UINT;
    ArraySize: UINT;
    DxgiFormat: DXGI_FORMAT;
    Dimension: WICDdsDimension;
    AlphaMode: WICDdsAlphaMode;
  end;



  // Interface IWICDdsDecoder
  // ========================
  //
  IWICDdsDecoder = interface(IUnknown)
    ['{409cd537-8532-40cb-9774-e2feb2df4e9c}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetParameters(pParameters: PWICDdsParameters): HRESULT; stdcall;

    function GetFrame(arrayIndex: UINT;
                      mipLevel: UINT;
                      sliceIndex: UINT;
                      out ppIBitmapFrame: IWICBitmapFrameDecode): HRESULT; stdcall;
  end;

  IID_IWICDdsDecoder = IWICDdsDecoder;



  // Interface IWICDdsEncoder
  // ========================
  //
  IWICDdsEncoder = interface(IUnknown)
    ['{5cacdb4c-407e-41b3-b936-d0f010cd6732}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function SetParameters(pParameters: PWICDdsParameters): HRESULT; stdcall;

    function GetParameters(pParameters: PWICDdsParameters): HRESULT; stdcall;

    function CreateNewFrame(out ppIFrameEncode: IWICBitmapFrameEncode;
                            pArrayIndex: PUINT;
                            pMipLevel: PUINT;
                            pSliceIndex: PUINT): HRESULT; stdcall;
  end;

  IID_IWICDdsEncoder = IWICDdsEncoder;



  PWICDdsFormatInfo = ^TWICDdsFormatInfo;

  WICDdsFormatInfo = record
    DxgiFormat: DXGI_FORMAT;
    BytesPerBlock: UINT;
    BlockWidth: UINT;
    BlockHeight: UINT;
  end;
  TWICDdsFormatInfo = WICDdsFormatInfo;


  // Interface IWICDdsFrameDecode
  // ============================
  //
  IWICDdsFrameDecode = interface(IUnknown)
    ['{3d4c0c61-18a4-41e4-bd80-481a4fc9f464}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetSizeInBlocks(pWidthInBlocks: PUINT;
                             pHeightInBlocks: PUINT): HRESULT; stdcall;

    function GetFormatInfo(pFormatInfo: PWICDdsFormatInfo): HRESULT; stdcall;

    function CopyBlocks(prcBoundsInBlocks: PWICRect;
                        cbStride: UINT;
                        cbBufferSize: UINT;
                        pbBuffer: PByte): HRESULT; stdcall;
  end;

  IID_IWICDdsFrameDecode = IWICDdsFrameDecode;


  // Interface IWICJpegFrameDecode
  // =============================
  //
  IWICJpegFrameDecode = interface(IUnknown)
    ['{8939F66E-C46A-4c21-A9D1-98B327CE1679}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function DoesSupportIndexing(pfIndexingSupported: PBOOL): HRESULT; stdcall;

    function SetIndexing(options: WICJpegIndexingOptions;
                         horizontalIntervalSize: UINT): HRESULT; stdcall;

    function ClearIndexing(): HRESULT; stdcall;

    function GetAcHuffmanTable(scanIndex: UINT;
                               tableIndex: UINT;
                               pAcHuffmanTable: PDXGI_JPEG_AC_HUFFMAN_TABLE): HRESULT; stdcall;

    function GetDcHuffmanTable(scanIndex: UINT;
                               tableIndex: UINT;
                               pDcHuffmanTable: PDXGI_JPEG_DC_HUFFMAN_TABLE): HRESULT; stdcall;

    function GetQuantizationTable(scanIndex: UINT;
                                  tableIndex: UINT;
                                  pQuantizationTable: PDXGI_JPEG_QUANTIZATION_TABLE): HRESULT; stdcall;

    function GetFrameHeader(pFrameHeader: PWICJpegFrameHeader): HRESULT; stdcall;

    function GetScanHeader(scanIndex: UINT;
                           pScanHeader: PWICJpegScanHeader): HRESULT; stdcall;

    function CopyScan(scanIndex: UINT;
                      scanOffset: UINT;
                      cbScanData: UINT;
                      pbScanData: PByte;
                      pcbScanDataActual: PUINT): HRESULT; stdcall;

    function CopyMinimalStream(streamOffset: UINT;
                               cbStreamData: UINT;
                               pbStreamData: PByte;
                               pcbStreamDataActual: PUINT): HRESULT; stdcall;
  end;

  IID_IWICJpegFrameDecode = IWICJpegFrameDecode;


  // Interface IWICJpegFrameEncode
  // =============================
  //
  IWICJpegFrameEncode = interface(IUnknown)
    ['{2F0C601F-D2C6-468C-ABFA-49495D983ED1}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetAcHuffmanTable(scanIndex: UINT;
                               tableIndex: UINT;
                               pAcHuffmanTable: PDXGI_JPEG_AC_HUFFMAN_TABLE): HRESULT; stdcall;

    function GetDcHuffmanTable(scanIndex: UINT;
                               tableIndex: UINT;
                               pDcHuffmanTable: PDXGI_JPEG_DC_HUFFMAN_TABLE): HRESULT; stdcall;

    function GetQuantizationTable(scanIndex: UINT;
                                  tableIndex: UINT;
                                  pQuantizationTable: PDXGI_JPEG_QUANTIZATION_TABLE): HRESULT; stdcall;

    function WriteScan(cbScanData: UINT;
                       pbScanData: PByte): HRESULT; stdcall;
  end;

  IID_IWICJpegFrameEncode = IWICJpegFrameEncode;



function MAKE_WINCODECHR(sev: DWORD;
                         code: DWORD): HResult;

function MAKE_WINCODECHR_ERR(code: DWORD): HResult;



//* Additional Prototypes for ALL interfaces *//

//* end of Additional Prototypes *//



type
  IWICBitmapSourceTransform2 = interface(IWICBitmapSourceTransform)
    ['{C3373FDF-6D39-4E5F-8E79-BF40C0B7ED77}']
    // SDK native virtual methods; optional buffers and arrays use pointer parameters.
    function GetColorContextsForPixelFormat(pPixelFormat: PWICPixelFormatGUID;
                                            cCount: UINT;
                                            ppIColorContexts: PIWICColorContext;
                                            pcActualCount: PUINT): HRESULT; stdcall;
  end;

  IID_IWICBitmapSourceTransform2 = IWICBitmapSourceTransform2;

implementation



const
  WincodecLib = 'windowscodecs.dll';


function MAKE_WINCODECHR(sev: DWORD;
                         code: DWORD): HResult;

begin

  Result := MAKE_HRESULT(sev,
                         FACILITY_WINCODEC_ERR,
                         (WINCODEC_ERR_BASE + code));
end;


function MAKE_WINCODECHR_ERR(code: DWORD): HResult;

begin

  Result := MAKE_WINCODECHR(1,
                            code);
end;


function WICConvertBitmapSource; external WincodecLib name 'WICConvertBitmapSource';
function WICCreateBitmapFromSection; external WincodecLib name 'WICCreateBitmapFromSection';
function WICCreateBitmapFromSectionEx; external WincodecLib name 'WICCreateBitmapFromSectionEx';
function WICMapGuidToShortName; external WincodecLib name 'WICMapGuidToShortName';
function WICMapShortNameToGuid; external WincodecLib name 'WICMapShortNameToGuid';
function WICMapSchemaToName; external WincodecLib name 'WICMapSchemaToName';


// Implement Additional functions here.

end.
