unit MfDuckingDirectShow;
{$I MfPack.Fpc.inc}
interface

uses
  Windows,
  ActiveX,
  WinApi.StrmIf,
  WinApi.UuIds;

type
  IFilterEnumerator = interface(IUnknown)
    ['{56A86893-0AD4-11CE-B03A-0020AF0BA770}']
    function Next(Count: LongWord;
                  out Filter: WinApi.StrmIf.IBaseFilter;
                  Fetched: Pointer): HResult; stdcall;
  end;

  IGraphBuilder = WinApi.StrmIf.IGraphBuilder;
  IMediaSeeking = WinApi.StrmIf.IMediaSeeking;
  IEnumFilters = WinApi.StrmIf.IEnumFilters;
  IBaseFilter = WinApi.StrmIf.IBaseFilter;
  REFERENCE_TIME = Int64;
  TFilterState = LongInt;
  OAEVENT = NativeInt;
  OAHWND = NativeInt;
  LONG_PTR = NativeInt;

  IMediaControl = interface(IDispatch)
    ['{56A868B1-0AD4-11CE-B03A-0020AF0BA770}']
    (*** IMediaControl methods ***)
    function Run: HResult; stdcall;
    function Pause: HResult; stdcall;
    function Stop: HResult; stdcall;
    function GetState(msTimeout: DWORD;
                      out pfs: TFilterState): HResult; stdcall;
    function RenderFile(strFilename: WideString): HResult; stdcall;
    function AddSourceFilter(strFilename: WideString;
                             out ppUnk: IDispatch): HResult; stdcall;
    function get_FilterCollection(out ppUnk: IDispatch): HResult; stdcall;
    function get_RegFilterCollection(out ppUnk: IDispatch): HResult; stdcall;
    function StopWhenReady: HResult; stdcall;
  end;

  IMediaEvent = interface(IDispatch)
    ['{56A868B6-0AD4-11CE-B03A-0020AF0BA770}']
    (*** IMediaEvent methods ***)
    function GetEventHandle(out hEvent: OAEVENT): HResult; stdcall;
    function GetEvent(out lEventCode: Longint;
                      out lParam1,
                      lParam2: LONG_PTR;
                      msTimeout: DWORD): HResult; stdcall;
    function WaitForCompletion(msTimeout: DWORD;
                               out pEvCode: Longint): HResult; stdcall;
    function CancelDefaultHandling(lEvCode: Longint): HResult; stdcall;
    function RestoreDefaultHandling(lEvCode: Longint): HResult; stdcall;
    function FreeEventParams(lEvCode: Longint;
                             lParam1,
                             lParam2: LONG_PTR): HResult; stdcall;
  end;

  IMediaEventEx = interface(IMediaEvent)
    ['{56A868C0-0AD4-11CE-B03A-0020AF0BA770}']
    (*** IMediaEventEx methods ***)
    function SetNotifyWindow(hwnd: OAHWND;
                             lMsg: Longint;
                             lInstanceData: LONG_PTR): HResult; stdcall;
    function SetNotifyFlags(lNoNotifyFlags: Longint): HResult; stdcall;
    function GetNotifyFlags(out lplNoNotifyFlags): HResult; stdcall; //longint
  end;


const
  CLSID_FilterGraph: TGUID = '{E436EBB3-524F-11CE-9F53-0020AF0BA770}';
  IID_IGraphBuilder = WinApi.StrmIf.IGraphBuilder;
  IID_IMediaSeeking = WinApi.StrmIf.IMediaSeeking;
  IID_IMediaControl = IMediaControl;
  IID_IMediaEventEx = IMediaEventEx;
  State_Running = 2;
  State_Paused = 1;
  IID_IMediaEvent = IMediaEventEx;
  AM_SEEKING_CanGetDuration = 32;
  AM_SEEKING_AbsolutePositioning = 1;
  AM_SEEKING_NoPositioning = 0;
  EC_COMPLETE = 1;
  EC_USERABORT = 2;
  EC_ERRORABORT = 3;

implementation

end.

