// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: WinApi.DirectX - D3D11
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: Winapi.DirectX.D3DCompiler.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 13-08-2025
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: D3D Compilation Types and APIs.
//              This header is used by HLSL. For more information, see:
//              https://learn.microsoft.com/en-us/windows/win32/api/_direct3dhlsl/
//
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX)
//
//------------------------------------------------------------------------------
// CHANGE LOG
// Date       Person              Reason
// ---------- ------------------- ----------------------------------------------
// 13/08/2025 All                 Ozzy Osbourne release  SDK 10.0.28000.2705 (Windows 11)
//------------------------------------------------------------------------------
//
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
// Source: D3DCompiler.h
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//==============================================================================
//
// FPC port updated: 2026-11-15
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
unit WinApi.DirectX.D3DCompiler;

{$I MfPack.Fpc.inc}

interface


uses
  Windows,
  WinApi.WinApiTypes,
  Winapi.DirectX.D3D11Shader,
  Winapi.DirectX.D3DCommon;


  {$ALIGN ON}


  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
  {$ALIGN 8}
  // Win64
  {$ENDIF}

  {$I 'WinApiTypes.inc'}

const
  // Current HLSL compiler version.
  D3D_COMPILER_VERSION = 47;



  //////////////////////////////////////////////////////////////////////////////
  // APIs
  //////////////////////////////////////////////////////////////////////////////


//----------------------------------------------------------------------------
// D3DReadFileToBlob:
// -----------------
// Simple helper routine to read a file on disk into memory
// for passing to other routines in this API.
//----------------------------------------------------------------------------
function D3DReadFileToBlob(pFileName: LPCWSTR;
                           out ppContents: ID3DBlob): HRESULT; stdcall;


//----------------------------------------------------------------------------
// D3DWriteBlobToFile:
// ------------------
// Simple helper routine to write a memory blob to a file on disk.
//----------------------------------------------------------------------------
function D3DWriteBlobToFile(pBlob: ID3DBlob;
                            pFileName: LPCWSTR;
                            bOverwrite: BOOL): HRESULT; stdcall;


//----------------------------------------------------------------------------
// D3DCOMPILE flags:
// -----------------
// D3DCOMPILE_DEBUG
//   Insert debug file/line/type/symbol information.
//
// D3DCOMPILE_SKIP_VALIDATION
//   Do not validate the generated code against known capabilities and
//   constraints.  This option is only recommended when compiling shaders
//   you KNOW will work.  (ie. have compiled before without this option.)
//   Shaders are always validated by D3D before they are set to the device.
//
// D3DCOMPILE_SKIP_OPTIMIZATION
//   Instructs the compiler to skip optimization steps during code generation.
//   Unless you are trying to isolate a problem in your code using this option
//   is not recommended.
//
// D3DCOMPILE_PACK_MATRIX_ROW_MAJOR
//   Unless explicitly specified, matrices will be packed in row-major order
//   on input and output from the shader.
//
// D3DCOMPILE_PACK_MATRIX_COLUMN_MAJOR
//   Unless explicitly specified, matrices will be packed in column-major
//   order on input and output from the shader.  This is generally more
//   efficient, since it allows vector-matrix multiplication to be performed
//   using a series of dot-products.
//
// D3DCOMPILE_PARTIAL_PRECISION
//   Force all computations in resulting shader to occur at partial precision.
//   This may result in faster evaluation of shaders on some hardware.
//
// D3DCOMPILE_FORCE_VS_SOFTWARE_NO_OPT
//   Force compiler to compile against the next highest available software
//   target for vertex shaders.  This flag also turns optimizations off,
//   and debugging on.
//
// D3DCOMPILE_FORCE_PS_SOFTWARE_NO_OPT
//   Force compiler to compile against the next highest available software
//   target for pixel shaders.  This flag also turns optimizations off,
//   and debugging on.
//
// D3DCOMPILE_NO_PRESHADER
//   Disables Preshaders. Using this flag will cause the compiler to not
//   pull out static expression for evaluation on the host cpu
//
// D3DCOMPILE_AVOID_FLOW_CONTROL
//   Hint compiler to avoid flow-control constructs where possible.
//
// D3DCOMPILE_PREFER_FLOW_CONTROL
//   Hint compiler to prefer flow-control constructs where possible.
//
// D3DCOMPILE_ENABLE_STRICTNESS
//   By default, the HLSL/Effect compilers are not strict on deprecated syntax.
//   Specifying this flag enables the strict mode. Deprecated syntax may be
//   removed in a future release, and enabling syntax is a good way to make
//   sure your shaders comply to the latest spec.
//
// D3DCOMPILE_ENABLE_BACKWARDS_COMPATIBILITY
//   This enables older shaders to compile to 4_0 targets.
//
//----------------------------------------------------------------------------
const

  D3DCOMPILE_DEBUG = (1 shl 0);
  D3DCOMPILE_SKIP_VALIDATION = (1 shl 1);
  D3DCOMPILE_SKIP_OPTIMIZATION = (1 shl 2);
  D3DCOMPILE_PACK_MATRIX_ROW_MAJOR = (1 shl 3);
  D3DCOMPILE_PACK_MATRIX_COLUMN_MAJOR = (1 shl 4);
  D3DCOMPILE_PARTIAL_PRECISION = (1 shl 5);
  D3DCOMPILE_FORCE_VS_SOFTWARE_NO_OPT = (1 shl 6);
  D3DCOMPILE_FORCE_PS_SOFTWARE_NO_OPT = (1 shl 7);
  D3DCOMPILE_NO_PRESHADER = (1 shl 8);
  D3DCOMPILE_AVOID_FLOW_CONTROL = (1 shl 9);
  D3DCOMPILE_PREFER_FLOW_CONTROL = (1 shl 10);
  D3DCOMPILE_ENABLE_STRICTNESS = (1 shl 11);
  D3DCOMPILE_ENABLE_BACKWARDS_COMPATIBILITY = (1 shl 12);
  D3DCOMPILE_IEEE_STRICTNESS = (1 shl 13);
  D3DCOMPILE_OPTIMIZATION_LEVEL0 = (1 shl 14);
  D3DCOMPILE_OPTIMIZATION_LEVEL1 = 0;
  D3DCOMPILE_OPTIMIZATION_LEVEL2 = ((1 shl 14) or (1 shl 15));
  D3DCOMPILE_OPTIMIZATION_LEVEL3 = (1 shl 15);
  D3DCOMPILE_RESERVED16 = (1 shl 16);
  D3DCOMPILE_RESERVED17 = (1 shl 17);
  D3DCOMPILE_WARNINGS_ARE_ERRORS = (1 shl 18);
  D3DCOMPILE_RESOURCES_MAY_ALIAS = (1 shl 19);
  D3DCOMPILE_ENABLE_UNBOUNDED_DESCRIPTOR_TABLES = (1 shl 20);
  D3DCOMPILE_ALL_RESOURCES_BOUND = (1 shl 21);
  D3DCOMPILE_DEBUG_NAME_FOR_SOURCE = (1 shl 22);
  D3DCOMPILE_DEBUG_NAME_FOR_BINARY = (1 shl 23);


  //----------------------------------------------------------------------------
  // D3DCOMPILE_EFFECT flags:
  // ---------------------------------------------------------------------------
  // These flags are passed in when creating an effect, and affect
  // either compilation behavior or runtime effect behavior
  //
  // D3DCOMPILE_EFFECT_CHILD_EFFECT
  //   Compile this .fx file to a child effect. Child effects have no
  //   initializers for any shared values as these are initialied in the
  //   master effect (pool).
  //
  // D3DCOMPILE_EFFECT_ALLOW_SLOW_OPS
  //   By default, performance mode is enabled.  Performance mode
  //   disallows mutable state objects by preventing non-literal
  //   expressions from appearing in state object definitions.
  //   Specifying this flag will disable the mode and allow for mutable
  //   state objects.
  //
  //----------------------------------------------------------------------------

  D3DCOMPILE_EFFECT_CHILD_EFFECT = (1 shl 0);
  D3DCOMPILE_EFFECT_ALLOW_SLOW_OPS = (1 shl 1);

  //----------------------------------------------------------------------------
  // D3DCOMPILE Flags2:
  // -----------------
  // Root signature flags. (passed in Flags2)
  D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_LATEST = 0;
  D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_0 = (1 shl 4);
  D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_1 = (1 shl 5);

  //----------------------------------------------------------------------------
  // D3DCompile:
  // ----------
  // Compile source text into bytecode appropriate for the given target.
  //----------------------------------------------------------------------------

  // D3D_COMPILE_STANDARD_FILE_INCLUDE can be passed for pInclude in any
  // API and indicates that a simple default include handler should be
  // used.  The include handler will include files relative to the
  // current directory and files relative to the directory of the initial source
  // file.  When used with APIs like D3DCompile pSourceName must be a
  // file name and the initial relative directory will be derived from it.
  //const
  //  D3D_COMPILE_STANDARD_FILE_INCLUDE ((ID3DInclude*)(UINT_PTR)1)

function D3DCompile(pSrcData: LPCVOID;
                    SrcDataSize: SIZE_T;
                    pSourceName: LPCSTR;
                    pDefines: LPD3D_SHADER_MACRO;
                    pInclude: ID3DInclude;
                    pEntrypoint: LPCSTR;
                    pTarget: LPCSTR;
                    Flags1: UINT;
                    Flags2: UINT;
                    out ppCode: ID3DBlob;
                    ppErrorMsgs: PID3DBlob): HRESULT; stdcall;


type

  pD3DCompile = function(pSrcData: LPCVOID;
                         SrcDataSize: SIZE_T;
                         pSourceName: LPCSTR;
                         pDefines: LPD3D_SHADER_MACRO;
                         pInclude: ID3DInclude;
                         pEntrypoint: LPCSTR;
                         pTarget: LPCSTR;
                         Flags1: UINT;
                         Flags2: UINT;
                         out ppCode: ID3DBlob;
                         ppErrorMsgs: PID3DBlob): HRESULT; stdcall;

const

  D3DCOMPILE_SECDATA_MERGE_UAV_SLOTS = $00000001;
  D3DCOMPILE_SECDATA_PRESERVE_TEMPLATE_SLOTS = $00000002;
  D3DCOMPILE_SECDATA_REQUIRE_TEMPLATE_MATCH = $00000004;


function D3DCompile2(pSrcData: LPCVOID;
                     SrcDataSize: SIZE_T;
                     pSourceName: LPCSTR;
                     pDefines: LPD3D_SHADER_MACRO;
                     pInclude: ID3DInclude;
                     pEntrypoint: LPCSTR;
                     pTarget: LPCSTR;
                     Flags1: UINT;
                     Flags2: UINT;
                     SecondaryDataFlags: UINT;
                     pSecondaryData: LPCVOID;
                     SecondaryDataSize: SIZE_T;
                     out ppCode: ID3DBlob;
                     ppErrorMsgs: PID3DBlob): HRESULT; stdcall;

function D3DCompileFromFile(pFileName: LPCWSTR;
                            pDefines: LPD3D_SHADER_MACRO;
                            pInclude: ID3DInclude;
                            pEntrypoint: LPCSTR;
                            pTarget: LPCSTR;
                            Flags1: UINT;
                            Flags2: UINT;
                            out ppCode: ID3DBlob;
                            ppErrorMsgs: PID3DBlob): HRESULT; stdcall;

//----------------------------------------------------------------------------
// D3DPreprocess:
// -------------
// Process source text with the compiler's preprocessor and return
// the resulting text.
//----------------------------------------------------------------------------

function D3DPreprocess(pSrcData: LPCVOID;
                       SrcDataSize: SIZE_T;
                       pSourceName: LPCSTR;
                       pDefines: LPD3D_SHADER_MACRO;
                       pInclude: ID3DInclude;
                       out ppCodeText: ID3DBlob;
                       ppErrorMsgs: PID3DBlob): HRESULT; stdcall;

type

  pD3DPreprocess = function(pSrcData: LPCVOID;
                            SrcDataSize: SIZE_T;
                            pSourceName: LPCSTR;
                            pDefines: LPD3D_SHADER_MACRO;
                            pInclude: ID3DInclude;
                            out ppCodeText: ID3DBlob;
                            ppErrorMsgs: PID3DBlob): HRESULT; stdcall;

  //----------------------------------------------------------------------------
  // D3DGetDebugInfo:
  // -----------------------
  // Gets shader debug info.  Debug info is generated by D3DCompile and is
  // embedded in the body of the shader.
  //----------------------------------------------------------------------------

function D3DGetDebugInfo(pSrcData: LPCVOID;
                         SrcDataSize: SIZE_T;
                         out ppDebugInfo: ID3DBlob): HRESULT; stdcall;

//----------------------------------------------------------------------------
// D3DReflect:
// ----------
// Shader code contains metadata that can be inspected via the
// reflection APIs.
//----------------------------------------------------------------------------

function D3DReflect(pSrcData: LPCVOID;
                    SrcDataSize: SIZE_T;
                    const pInterface: TGUID;
                    out ppReflector): HRESULT; stdcall;

//----------------------------------------------------------------------------
// D3DReflectLibrary:
// ----------
// Library code contains metadata that can be inspected via the library
// reflection APIs.
//----------------------------------------------------------------------------

function D3DReflectLibrary(pSrcData: LPCVOID;
                           SrcDataSize: SIZE_T;
                           const riid: TGUID;
                           out ppReflector): HRESULT; stdcall;

//----------------------------------------------------------------------------
// D3DDisassemble:
// ----------------------
// Takes a binary shader and returns a buffer containing text assembly.
//----------------------------------------------------------------------------

const

  D3D_DISASM_ENABLE_COLOR_CODE = $00000001;
  D3D_DISASM_ENABLE_DEFAULT_VALUE_PRINTS = $00000002;
  D3D_DISASM_ENABLE_INSTRUCTION_NUMBERING = $00000004;
  D3D_DISASM_ENABLE_INSTRUCTION_CYCLE = $00000008;
  D3D_DISASM_DISABLE_DEBUG_INFO = $00000010;
  D3D_DISASM_ENABLE_INSTRUCTION_OFFSET = $00000020;
  D3D_DISASM_INSTRUCTION_ONLY = $00000040;
  D3D_DISASM_PRINT_HEX_LITERALS = $00000080;

function D3DDisassemble(pSrcData: LPCVOID;
                        SrcDataSize: SIZE_T;
                        Flags: UINT;
                        szComments: LPCSTR;
                        out ppDisassembly: ID3DBlob): HRESULT; stdcall;

type

  pD3DDisassemble = function(pSrcData: LPCVOID;
                             SrcDataSize: SIZE_T;
                             Flags: UINT;
    {in_opt} szComments: LPCSTR;
                             out ppDisassembly: ID3DBlob): HRESULT; stdcall;

function D3DDisassembleRegion(pSrcData: LPCVOID;
                              SrcDataSize: SIZE_T;
                              Flags: UINT;
                              szComments: LPCSTR;
                              StartByteOffset: SIZE_T;
                              NumInsts: SIZE_T;
                              pFinishByteOffset: PSIZE_T;
                              out ppDisassembly: ID3DBlob): HRESULT; stdcall;

//----------------------------------------------------------------------------
// Shader linking and Function Linking Graph (FLG) APIs
//----------------------------------------------------------------------------

function D3DCreateLinker(out ppLinker: ID3D11Linker): HRESULT; stdcall;

function D3DLoadModule(pSrcData: LPCVOID;
                       cbSrcDataSize: SIZE_T;
                       out ppModule: ID3D11Module): HRESULT; stdcall;

function D3DCreateFunctionLinkingGraph(uFlags: UINT;
                                       out ppFunctionLinkingGraph: ID3D11FunctionLinkingGraph): HRESULT; stdcall;

//----------------------------------------------------------------------------
// D3DGetTraceInstructionOffsets:
// ------------------------------
// Determines byte offsets for instructions within a shader blob.
// This information is useful for going between trace instruction
// indices and byte offsets that are used in debug information.
//----------------------------------------------------------------------------

const

  D3D_GET_INST_OFFSETS_INCLUDE_NON_EXECUTABLE = $00000001;

function D3DGetTraceInstructionOffsets(pSrcData: LPCVOID;
                                       SrcDataSize: SIZE_T;
                                       Flags: UINT;
                                       StartInstIndex: SIZE_T;
                                       NumInsts: SIZE_T;
                                       pOffsets: PSIZE_T;
                                       pTotalInsts: PSIZE_T): HRESULT; stdcall;

//----------------------------------------------------------------------------
// D3DGetInputSignatureBlob:
// -----------------------
// Retrieve the input signature from a compilation result.
//----------------------------------------------------------------------------


function D3DGetInputSignatureBlob(pSrcData: LPCVOID;
                                  SrcDataSize: SIZE_T;
                                  out ppSignatureBlob: ID3DBlob): HRESULT; stdcall;

//----------------------------------------------------------------------------
// D3DGetOutputSignatureBlob:
// -----------------------
// Retrieve the output signature from a compilation result.
//----------------------------------------------------------------------------

function D3DGetOutputSignatureBlob(pSrcData: LPCVOID;
                                   SrcDataSize: SIZE_T;
                                   out ppSignatureBlob: ID3DBlob): HRESULT; stdcall;

//----------------------------------------------------------------------------
// D3DGetInputAndOutputSignatureBlob:
// -----------------------
// Retrieve the input and output signatures from a compilation result.
//----------------------------------------------------------------------------

function D3DGetInputAndOutputSignatureBlob(pSrcData: LPCVOID;
                                           SrcDataSize: SIZE_T;
                                           out ppSignatureBlob: ID3DBlob): HRESULT; stdcall;

//----------------------------------------------------------------------------
// D3DStripShader:
// -----------------------
// Removes unwanted blobs from a compilation result
//----------------------------------------------------------------------------

type

  PD3DCOMPILER_STRIP_FLAGS = ^D3DCOMPILER_STRIP_FLAGS;
  D3DCOMPILER_STRIP_FLAGS = (
    D3DCOMPILER_STRIP_REFLECTION_DATA = $00000001,
                             D3DCOMPILER_STRIP_DEBUG_INFO = $00000002,
                             D3DCOMPILER_STRIP_TEST_BLOBS = $00000004,
                             D3DCOMPILER_STRIP_PRIVATE_DATA = $00000008,
                             D3DCOMPILER_STRIP_ROOT_SIGNATURE = $00000010,
                             D3DCOMPILER_STRIP_FORCE_DWORD = $7FFFFFFF);


function D3DStripShader(pShaderBytecode: LPCVOID;
                        BytecodeLength: SIZE_T;
                        uStripFlags: UINT;
                        out ppStrippedBlob: ID3DBlob): HRESULT; stdcall;//----------------------------------------------------------------------------
// D3DGetBlobPart:
// -----------------------
// Extracts information from a compilation result.
//----------------------------------------------------------------------------

type

  PD3D_BLOB_PART = ^D3D_BLOB_PART;
  D3D_BLOB_PART = (D3D_BLOB_INPUT_SIGNATURE_BLOB,
                   D3D_BLOB_OUTPUT_SIGNATURE_BLOB,
                   D3D_BLOB_INPUT_AND_OUTPUT_SIGNATURE_BLOB,
                   D3D_BLOB_PATCH_CONSTANT_SIGNATURE_BLOB,
                   D3D_BLOB_ALL_SIGNATURE_BLOB,
                   D3D_BLOB_DEBUG_INFO,
                   D3D_BLOB_LEGACY_SHADER,
                   D3D_BLOB_XNA_PREPASS_SHADER,
                   D3D_BLOB_XNA_SHADER,
                   D3D_BLOB_PDB,
                   D3D_BLOB_PRIVATE_DATA,
                   D3D_BLOB_ROOT_SIGNATURE,
    // Test parts are only produced by special compiler versions and so
    // are usually not present in shaders.
    D3D_BLOB_TEST_ALTERNATE_SHADER = $8000,
                   D3D_BLOB_TEST_COMPILE_DETAILS,
                   D3D_BLOB_TEST_COMPILE_PERF,
                   D3D_BLOB_TEST_COMPILE_REPORT);


function D3DGetBlobPart(pSrcData: LPCVOID;
                        SrcDataSize: SIZE_T;
                        Part: D3D_BLOB_PART;
                        Flags: UINT;
                        out ppPart: ID3DBlob): HRESULT; stdcall;

//----------------------------------------------------------------------------
// D3DSetBlobPart:
// -----------------------
// Update information in a compilation result.
//----------------------------------------------------------------------------

function D3DSetBlobPart(pSrcData: LPCVOID;
                        SrcDataSize: SIZE_T;
                        Part: D3D_BLOB_PART;
                        Flags: UINT;
                        pPart: LPCVOID;
                        PartSize: SIZE_T;
                        out ppNewShader: ID3DBlob): HRESULT; stdcall;

//----------------------------------------------------------------------------
// D3DCreateBlob:
// -----------------------
// Create an ID3DBlob instance.
//----------------------------------------------------------------------------

function D3DCreateBlob(Size: SIZE_T;
                       out ppBlob: ID3DBlob): HRESULT; stdcall;

//----------------------------------------------------------------------------
// D3DCompressShaders:
// -----------------------
// Compresses a set of shaders into a more compact form.
//----------------------------------------------------------------------------

type

  PD3D_SHADER_DATA = ^D3D_SHADER_DATA;

  _D3D_SHADER_DATA = record
    pBytecode: LPCVOID;
    BytecodeLength: SIZE_T;
  end;
  D3D_SHADER_DATA = _D3D_SHADER_DATA;



const

  D3D_COMPRESS_SHADER_KEEP_ALL_PARTS = $00000001;


function D3DCompressShaders(uNumShaders: UINT;
                            pShaderData: PD3D_SHADER_DATA;
                            uFlags: UINT;
                            out ppCompressedData: ID3DBlob): HRESULT; stdcall;

//----------------------------------------------------------------------------
// D3DDecompressShaders:
// -----------------------
// Decompresses one or more shaders from a compressed set.
//----------------------------------------------------------------------------

function D3DDecompressShaders(pSrcData: LPCVOID;
                              SrcDataSize: SIZE_T;
                              uNumShaders: UINT;
                              uStartIndex: UINT;
                              pIndices: PUINT;
                              uFlags: UINT;
                              ppShaders: PID3DBlob;
                              pTotalShaders: PUINT): HRESULT; stdcall;


//----------------------------------------------------------------------------
// D3DDisassemble10Effect:
// -----------------------
// Takes a D3D10 effect interface and returns a
// buffer containing text assembly.
//----------------------------------------------------------------------------

function D3DDisassemble10Effect(pEffect: Pointer;
                                Flags: UINT;
                                out ppDisassembly: ID3DBlob): HRESULT; stdcall;

const
  // Native compiler sentinel; this is not a dereferenceable include handler.
  D3D_COMPILE_STANDARD_FILE_INCLUDE = ID3DInclude(1);

const
  D3D_BLOB_DEBUG_NAME: D3D_BLOB_PART = D3D_BLOB_PART(12);

implementation

const

  D3DCOMPILER_DLL_W = 'd3dcompiler_47.dll';

  D3DCOMPILER_DLL_A = 'd3dcompiler_47.dll';


  {$IFDEF UNICODE}
    D3DCOMPILER_DLL = D3DCOMPILER_DLL_W;
  {$ELSE}
  D3DCOMPILER_DLL = D3DCOMPILER_DLL_A;
  {$ENDIF}



  D3DCompilerLib = D3DCOMPILER_DLL_W;


function D3DReadFileToBlob; external D3DCompilerLib name 'D3DReadFileToBlob';
function D3DWriteBlobToFile; external D3DCompilerLib name 'D3DWriteBlobToFile';
function D3DCompile; external D3DCompilerLib name 'D3DCompile';
function D3DCompile2; external D3DCompilerLib name 'D3DCompile2';
function D3DCompileFromFile; external D3DCompilerLib name 'D3DCompileFromFile';
function D3DPreprocess; external D3DCompilerLib name 'D3DPreprocess';
function D3DGetDebugInfo; external D3DCompilerLib name 'D3DGetDebugInfo';
function D3DReflect; external D3DCompilerLib name 'D3DReflect';
function D3DReflectLibrary; external D3DCompilerLib name 'D3DReflectLibrary';
function D3DDisassemble; external D3DCompilerLib name 'D3DDisassemble';
function D3DDisassembleRegion; external D3DCompilerLib name 'D3DDisassembleRegion';
function D3DCreateLinker; external D3DCompilerLib name 'D3DCreateLinker';
function D3DLoadModule; external D3DCompilerLib name 'D3DLoadModule';
function D3DCreatefunctionLinkingGraph; external D3DCompilerLib name 'D3DCreateFunctionLinkingGraph';
function D3DGetTraceInstructionOffsets; external D3DCompilerLib name 'D3DGetTraceInstructionOffsets';
function D3DGetInputSignatureBlob; external D3DCompilerLib name 'D3DGetInputSignatureBlob';
function D3DGetOutputSignatureBlob; external D3DCompilerLib name 'D3DGetOutputSignatureBlob';
function D3DGetInputAndOutputSignatureBlob; external D3DCompilerLib name 'D3DGetInputAndOutputSignatureBlob';
function D3DStripShader; external D3DCompilerLib name 'D3DStripShader';
function D3DGetBlobPart; external D3DCompilerLib name 'D3DGetBlobPart';
function D3DSetBlobPart; external D3DCompilerLib name 'D3DSetBlobPart';
function D3DCreateBlob; external D3DCompilerLib name 'D3DCreateBlob';
function D3DCompressShaders; external D3DCompilerLib name 'D3DCompressShaders';
function D3DDecompressShaders; external D3DCompilerLib name 'D3DDecompressShaders';
function D3DDisassemble10Effect; external D3DCompilerLib name 'D3DDisassemble10Effect';

end.
