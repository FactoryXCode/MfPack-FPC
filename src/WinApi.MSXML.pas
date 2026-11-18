// FactoryX
//
// Copyright: � FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.MSXML.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 06-10-2015
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Native MSXML DOM interfaces used by Shell APIs.
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
// Remarks: This is the newest WinApi.MSXML.pas
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
// Source: structuredquerycondition.h
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//==============================================================================
//
// FPC port updated: 2026-11-13
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
// MfPack FPC compatibility declarations for the MSXML DOM interfaces.
// Source: Windows SDK 10.0.28000.0 msxml.h (Microsoft).
// BSTR and VARIANT outputs retain native ownership; release them with the
// matching Automation cleanup function. No XML component is activated here.
unit WinApi.MSXML;

{$I MfPack.Fpc.inc}

interface

uses Windows,WinApi.WinApiTypes,WinApi.Unknwn,WinApi.ActiveX.OaIdl;

{$PACKENUM 4}

type
  DOMNodeType = (NODE_INVALID = 0,
                 NODE_ELEMENT = 1,
                 NODE_ATTRIBUTE = 2,
                 NODE_TEXT = 3,
                 NODE_CDATA_SECTION = 4,
                 NODE_ENTITY_REFERENCE = 5,
                 NODE_ENTITY = 6,
                 NODE_PROCESSING_INSTRUCTION = 7,
                 NODE_COMMENT = 8,
                 NODE_DOCUMENT = 9,
                 NODE_DOCUMENT_TYPE = 10,
                 NODE_DOCUMENT_FRAGMENT = 11,
                 NODE_NOTATION = 12
                );

  IXMLDOMImplementation = interface;
  IXMLDOMNode = interface;
  IXMLDOMDocumentFragment = interface;
  IXMLDOMDocument = interface;
  IXMLDOMNodeList = interface;
  IXMLDOMNamedNodeMap = interface;
  IXMLDOMCharacterData = interface;
  IXMLDOMAttribute = interface;
  IXMLDOMElement = interface;
  IXMLDOMText = interface;
  IXMLDOMComment = interface;
  IXMLDOMProcessingInstruction = interface;
  IXMLDOMCDATASection = interface;
  IXMLDOMDocumentType = interface;
  IXMLDOMNotation = interface;
  IXMLDOMEntity = interface;
  IXMLDOMEntityReference = interface;
  IXMLDOMParseError = interface;

  IXMLDOMImplementation = interface(IDispatch)
    ['{2933BF8F-7B36-11d2-B20E-00C04F983E60}']
    function hasFeature(feature: BSTR;
                        version: BSTR;
                        out hasFeature: WordBool): HRESULT; stdcall;
  end;

  IXMLDOMNode = interface(IDispatch)
    ['{2933BF80-7B36-11d2-B20E-00C04F983E60}']
    function get_nodeName(out name: BSTR): HRESULT; stdcall;
    function get_nodeValue(value: PVARIANT): HRESULT; stdcall;
    function put_nodeValue(value: VARIANT): HRESULT; stdcall;
    function get_nodeType(out _type: DOMNodeType): HRESULT; stdcall;
    function get_parentNode(out parent: IXMLDOMNode): HRESULT; stdcall;
    function get_childNodes(out childList: IXMLDOMNodeList): HRESULT; stdcall;
    function get_firstChild(out firstChild: IXMLDOMNode): HRESULT; stdcall;
    function get_lastChild(out lastChild: IXMLDOMNode): HRESULT; stdcall;
    function get_previousSibling(out previousSibling: IXMLDOMNode): HRESULT; stdcall;
    function get_nextSibling(out nextSibling: IXMLDOMNode): HRESULT; stdcall;
    function get_attributes(out attributeMap: IXMLDOMNamedNodeMap): HRESULT; stdcall;
    function insertBefore(newChild: IXMLDOMNode;
                          refChild: VARIANT;
                          out outNewChild: IXMLDOMNode): HRESULT; stdcall;
    function replaceChild(newChild: IXMLDOMNode;
                          oldChild: IXMLDOMNode;
                          out outOldChild: IXMLDOMNode): HRESULT; stdcall;
    function removeChild(childNode: IXMLDOMNode;
                         out oldChild: IXMLDOMNode): HRESULT; stdcall;
    function appendChild(newChild: IXMLDOMNode;
                         out outNewChild: IXMLDOMNode): HRESULT; stdcall;
    function hasChildNodes(out hasChild: WordBool): HRESULT; stdcall;
    function get_ownerDocument(out XMLDOMDocument: IXMLDOMDocument): HRESULT; stdcall;
    function cloneNode(deep: WordBool;
                       out cloneRoot: IXMLDOMNode): HRESULT; stdcall;
    function get_nodeTypeString(out nodeType: BSTR): HRESULT; stdcall;
    function get_text(out text: BSTR): HRESULT; stdcall;
    function put_text(text: BSTR): HRESULT; stdcall;
    function get_specified(out isSpecified: WordBool): HRESULT; stdcall;
    function get_definition(out definitionNode: IXMLDOMNode): HRESULT; stdcall;
    function get_nodeTypedValue(typedValue: PVARIANT): HRESULT; stdcall;
    function put_nodeTypedValue(typedValue: VARIANT): HRESULT; stdcall;
    function get_dataType(dataTypeName: PVARIANT): HRESULT; stdcall;
    function put_dataType(dataTypeName: BSTR): HRESULT; stdcall;
    function get_xml(out xmlString: BSTR): HRESULT; stdcall;
    function transformNode(stylesheet: IXMLDOMNode;
                           out xmlString: BSTR): HRESULT; stdcall;
    function selectNodes(queryString: BSTR;
                         out resultList: IXMLDOMNodeList): HRESULT; stdcall;
    function selectSingleNode(queryString: BSTR;
                              out resultNode: IXMLDOMNode): HRESULT; stdcall;
    function get_parsed(out isParsed: WordBool): HRESULT; stdcall;
    function get_namespaceURI(out namespaceURI: BSTR): HRESULT; stdcall;
    function get_prefix(out prefixString: BSTR): HRESULT; stdcall;
    function get_baseName(out nameString: BSTR): HRESULT; stdcall;
    function transformNodeToObject(stylesheet: IXMLDOMNode;
                                   outputObject: VARIANT): HRESULT; stdcall;
  end;

  IXMLDOMDocumentFragment = interface(IXMLDOMNode)
    ['{3efaa413-272f-11d2-836f-0000f87a7782}']
  end;

  IXMLDOMDocument = interface(IXMLDOMNode)
    ['{2933BF81-7B36-11d2-B20E-00C04F983E60}']
    function get_doctype(out documentType: IXMLDOMDocumentType): HRESULT; stdcall;
    function get_implementation(out impl: IXMLDOMImplementation): HRESULT; stdcall;
    function get_documentElement(out DOMElement: IXMLDOMElement): HRESULT; stdcall;
    function putref_documentElement(DOMElement: IXMLDOMElement): HRESULT; stdcall;
    function createElement(tagName: BSTR;
                           out element: IXMLDOMElement): HRESULT; stdcall;
    function createDocumentFragment(out docFrag: IXMLDOMDocumentFragment): HRESULT; stdcall;
    function createTextNode(data: BSTR;
                            out text: IXMLDOMText): HRESULT; stdcall;
    function createComment(data: BSTR;
                           out comment: IXMLDOMComment): HRESULT; stdcall;
    function createCDATASection(data: BSTR;
                                out cdata: IXMLDOMCDATASection): HRESULT; stdcall;
    function createProcessingInstruction(target: BSTR;
                                         data: BSTR;
                                         out pi: IXMLDOMProcessingInstruction): HRESULT; stdcall;
    function createAttribute(name: BSTR;
                             out attribute: IXMLDOMAttribute): HRESULT; stdcall;
    function createEntityReference(name: BSTR;
                                   out entityRef: IXMLDOMEntityReference): HRESULT; stdcall;
    function getElementsByTagName(tagName: BSTR;
                                  out resultList: IXMLDOMNodeList): HRESULT; stdcall;
    function createNode(_Type: VARIANT;
                        name: BSTR;
                        namespaceURI: BSTR;
                        out node: IXMLDOMNode): HRESULT; stdcall;
    function nodeFromID(idString: BSTR;
                        out node: IXMLDOMNode): HRESULT; stdcall;
    function load(xmlSource: VARIANT;
                  out isSuccessful: WordBool): HRESULT; stdcall;
    function get_readyState(out value: LONG): HRESULT; stdcall;
    function get_parseError(out errorObj: IXMLDOMParseError): HRESULT; stdcall;
    function get_url(out urlString: BSTR): HRESULT; stdcall;
    function get_async(out isAsync: WordBool): HRESULT; stdcall;
    function put_async(isAsync: WordBool): HRESULT; stdcall;
    function abort: HRESULT; stdcall;
    function loadXML(bstrXML: BSTR;
                     out isSuccessful: WordBool): HRESULT; stdcall;
    function save(destination: VARIANT): HRESULT; stdcall;
    function get_validateOnParse(out isValidating: WordBool): HRESULT; stdcall;
    function put_validateOnParse(isValidating: WordBool): HRESULT; stdcall;
    function get_resolveExternals(out isResolving: WordBool): HRESULT; stdcall;
    function put_resolveExternals(isResolving: WordBool): HRESULT; stdcall;
    function get_preserveWhiteSpace(out isPreserving: WordBool): HRESULT; stdcall;
    function put_preserveWhiteSpace(isPreserving: WordBool): HRESULT; stdcall;
    function put_onreadystatechange(readystatechangeSink: VARIANT): HRESULT; stdcall;
    function put_ondataavailable(ondataavailableSink: VARIANT): HRESULT; stdcall;
    function put_ontransformnode(ontransformnodeSink: VARIANT): HRESULT; stdcall;
  end;

  IXMLDOMNodeList = interface(IDispatch)
    ['{2933BF82-7B36-11d2-B20E-00C04F983E60}']
    function get_item(index: LONG;
                      out listItem: IXMLDOMNode): HRESULT; stdcall;
    function get_length(out listLength: LONG): HRESULT; stdcall;
    function nextNode(out nextItem: IXMLDOMNode): HRESULT; stdcall;
    function reset: HRESULT; stdcall;
    function get__newEnum(out ppUnk: IUnknown): HRESULT; stdcall;
  end;

  IXMLDOMNamedNodeMap = interface(IDispatch)
    ['{2933BF83-7B36-11d2-B20E-00C04F983E60}']
    function getNamedItem(name: BSTR;
                          out namedItem: IXMLDOMNode): HRESULT; stdcall;
    function setNamedItem(newItem: IXMLDOMNode;
                          out nameItem: IXMLDOMNode): HRESULT; stdcall;
    function removeNamedItem(name: BSTR;
                             out namedItem: IXMLDOMNode): HRESULT; stdcall;
    function get_item(index: LONG;
                      out listItem: IXMLDOMNode): HRESULT; stdcall;
    function get_length(out listLength: LONG): HRESULT; stdcall;
    function getQualifiedItem(baseName: BSTR;
                              namespaceURI: BSTR;
                              out qualifiedItem: IXMLDOMNode): HRESULT; stdcall;
    function removeQualifiedItem(baseName: BSTR;
                                 namespaceURI: BSTR;
                                 out qualifiedItem: IXMLDOMNode): HRESULT; stdcall;
    function nextNode(out nextItem: IXMLDOMNode): HRESULT; stdcall;
    function reset: HRESULT; stdcall;
    function get__newEnum(out ppUnk: IUnknown): HRESULT; stdcall;
  end;

  IXMLDOMCharacterData = interface(IXMLDOMNode)
    ['{2933BF84-7B36-11d2-B20E-00C04F983E60}']
    function get_data(out data: BSTR): HRESULT; stdcall;
    function put_data(data: BSTR): HRESULT; stdcall;
    function get_length(out dataLength: LONG): HRESULT; stdcall;
    function substringData(offset: LONG;
                           count: LONG;
                           out data: BSTR): HRESULT; stdcall;
    function appendData(data: BSTR): HRESULT; stdcall;
    function insertData(offset: LONG;
                        data: BSTR): HRESULT; stdcall;
    function deleteData(offset: LONG;
                        count: LONG): HRESULT; stdcall;
    function replaceData(offset: LONG;
                         count: LONG;
                         data: BSTR): HRESULT; stdcall;
  end;

  IXMLDOMAttribute = interface(IXMLDOMNode)
    ['{2933BF85-7B36-11d2-B20E-00C04F983E60}']
    function get_name(out attributeName: BSTR): HRESULT; stdcall;
    function get_value(attributeValue: PVARIANT): HRESULT; stdcall;
    function put_value(attributeValue: VARIANT): HRESULT; stdcall;
  end;

  IXMLDOMElement = interface(IXMLDOMNode)
    ['{2933BF86-7B36-11d2-B20E-00C04F983E60}']
    function get_tagName(out tagName: BSTR): HRESULT; stdcall;
    function getAttribute(name: BSTR;
                          value: PVARIANT): HRESULT; stdcall;
    function setAttribute(name: BSTR;
                          value: VARIANT): HRESULT; stdcall;
    function removeAttribute(name: BSTR): HRESULT; stdcall;
    function getAttributeNode(name: BSTR;
                              out attributeNode: IXMLDOMAttribute): HRESULT; stdcall;
    function setAttributeNode(DOMAttribute: IXMLDOMAttribute;
                              out attributeNode: IXMLDOMAttribute): HRESULT; stdcall;
    function removeAttributeNode(DOMAttribute: IXMLDOMAttribute;
                                 out attributeNode: IXMLDOMAttribute): HRESULT; stdcall;
    function getElementsByTagName(tagName: BSTR;
                                  out resultList: IXMLDOMNodeList): HRESULT; stdcall;
    function normalize: HRESULT; stdcall;
  end;

  IXMLDOMText = interface(IXMLDOMCharacterData)
    ['{2933BF87-7B36-11d2-B20E-00C04F983E60}']
    function splitText(offset: LONG;
                       out rightHandTextNode: IXMLDOMText): HRESULT; stdcall;
  end;

  IXMLDOMComment = interface(IXMLDOMCharacterData)
    ['{2933BF88-7B36-11d2-B20E-00C04F983E60}']
  end;

  IXMLDOMProcessingInstruction = interface(IXMLDOMNode)
    ['{2933BF89-7B36-11d2-B20E-00C04F983E60}']
    function get_target(out name: BSTR): HRESULT; stdcall;
    function get_data(out value: BSTR): HRESULT; stdcall;
    function put_data(value: BSTR): HRESULT; stdcall;
  end;

  IXMLDOMCDATASection = interface(IXMLDOMText)
    ['{2933BF8A-7B36-11d2-B20E-00C04F983E60}']
  end;

  IXMLDOMDocumentType = interface(IXMLDOMNode)
    ['{2933BF8B-7B36-11d2-B20E-00C04F983E60}']
    function get_name(out rootName: BSTR): HRESULT; stdcall;
    function get_entities(out entityMap: IXMLDOMNamedNodeMap): HRESULT; stdcall;
    function get_notations(out notationMap: IXMLDOMNamedNodeMap): HRESULT; stdcall;
  end;

  IXMLDOMNotation = interface(IXMLDOMNode)
    ['{2933BF8C-7B36-11d2-B20E-00C04F983E60}']
    function get_publicId(publicID: PVARIANT): HRESULT; stdcall;
    function get_systemId(systemID: PVARIANT): HRESULT; stdcall;
  end;

  IXMLDOMEntity = interface(IXMLDOMNode)
    ['{2933BF8D-7B36-11d2-B20E-00C04F983E60}']
    function get_publicId(publicID: PVARIANT): HRESULT; stdcall;
    function get_systemId(systemID: PVARIANT): HRESULT; stdcall;
    function get_notationName(out name: BSTR): HRESULT; stdcall;
  end;

  IXMLDOMEntityReference = interface(IXMLDOMNode)
    ['{2933BF8E-7B36-11d2-B20E-00C04F983E60}']
  end;

  IXMLDOMParseError = interface(IDispatch)
    ['{3efaa426-272f-11d2-836f-0000f87a7782}']
    function get_errorCode(out errorCode: LONG): HRESULT; stdcall;
    function get_url(out urlString: BSTR): HRESULT; stdcall;
    function get_reason(out reasonString: BSTR): HRESULT; stdcall;
    function get_srcText(out sourceString: BSTR): HRESULT; stdcall;
    function get_line(out lineNumber: LONG): HRESULT; stdcall;
    function get_linepos(out linePosition: LONG): HRESULT; stdcall;
    function get_filepos(out filePosition: LONG): HRESULT; stdcall;
  end;

implementation

end.
