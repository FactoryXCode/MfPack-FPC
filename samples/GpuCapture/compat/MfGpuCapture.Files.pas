unit MfGpuCapture.Files;

{$mode delphiunicode}

interface

uses
  SysUtils,
  Classes;

type
  TFile = class

  public
    class procedure WriteAllText(const Name: UnicodeString;
                                 const Text: UnicodeString;
                                 Encoding: TEncoding); static;
    class procedure AppendAllText(const Name: UnicodeString;
                                  const Text: UnicodeString;
                                  Encoding: TEncoding); static;
  end;

implementation


procedure WriteBytes(Stream: TStream;
                     const Bytes: TBytes);

begin

  if (Length(Bytes) > 0) then
    Stream.WriteBuffer(Bytes[0],
                       Length(Bytes));
end;


class procedure TFile.WriteAllText(const Name: UnicodeString;
                                   const Text: UnicodeString;
                                   Encoding: TEncoding);
var
  Stream: TFileStream;

begin

  Stream := TFileStream.Create(Name,
                               fmCreate);
  try
    WriteBytes(Stream,
               Encoding.GetPreamble());
    WriteBytes(Stream,
               Encoding.GetBytes(Text));
  finally
    Stream.Free;
  end;
end;


class procedure TFile.AppendAllText(const Name: UnicodeString;
                                    const Text: UnicodeString;
                                    Encoding: TEncoding);
var
  Stream: TFileStream;

begin

  if not FileExists(Name) then
    begin
      WriteAllText(Name,
                   Text,
                   Encoding);
      Exit;
    end;
  Stream := TFileStream.Create(Name,
                               fmOpenWrite or fmShareDenyWrite);
  try
    Stream.Position := Stream.Size;
    WriteBytes(Stream,
               Encoding.GetBytes(Text));
  finally
    Stream.Free;
  end;
end;

end.
