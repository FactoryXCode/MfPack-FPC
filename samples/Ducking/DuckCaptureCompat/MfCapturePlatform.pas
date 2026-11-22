unit MfCapturePlatform;
{$I MfPack.Fpc.inc}
interface

uses
  Windows;

const
  DEVICE_NOTIFY_WINDOW_HANDLE = 0;

function RegisterDeviceNotificationW(Recipient: THandle;
                                     Filter: Pointer;
                                     Flags: DWORD): THandle; stdcall; external 'user32.dll';
function UnregisterDeviceNotification(Notification: THandle): BOOL; stdcall; external 'user32.dll';

implementation

end.
