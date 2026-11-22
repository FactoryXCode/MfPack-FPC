unit Rdj.SQLite;
{$mode delphiunicode}
interface

uses
  Classes,
  SysUtils,
  DB,
  SQLDB,
  SQLite3Conn,
  sqlite3dyn;

type
  TFDTransaction = TSQLTransaction;

  TFDConnection = class(TSQLite3Connection)

  private
    FUpdateTransaction: TSQLTransaction;

  protected
    procedure DoInternalConnect; override;

  public
    DriverName: UnicodeString;
    property UpdateTransaction: TSQLTransaction read FUpdateTransaction write FUpdateTransaction;
  end;

  TFDQuery = class(TSQLQuery)

  private
    FConnection: TFDConnection;
    FOwnTransaction: Boolean;
    procedure SetConnection(Value: TFDConnection);

  public
    destructor Destroy; override;
    procedure Open;
    procedure Close;
    procedure ExecSQL;
    property Connection: TFDConnection read FConnection write SetConnection;
  end;

implementation


procedure TFDConnection.DoInternalConnect;
var
  Error: PAnsiChar;
  Code: Integer;

begin

  DatabaseName := Params.Values['Database'];
  CharSet := 'UTF8';
  if SameText(Params.Values['OpenMode'], 'ReadOnly') then
    OpenFlags := [sofReadOnly, sofPrivateCache]
  else
    OpenFlags := [sofReadWrite, sofCreate, sofPrivateCache];
  inherited;
  sqlite3_busy_timeout(Handle,
                       5000);
  if not SameText(Params.Values['OpenMode'], 'ReadOnly') then
    begin
      Error := nil;
      Code := sqlite3_exec(Handle,
                           'PRAGMA journal_mode=WAL; PRAGMA synchronous=NORMAL; PRAGMA foreign_keys=ON;',
                           nil,
                           nil,
                           @Error);
      if (Code <> SQLITE_OK) then
        begin
          try
            raise EDatabaseError.Create(UTF8Decode(Error));
          finally
            sqlite3_free(Error);
          end;
        end;
    end;
end;


procedure TFDQuery.SetConnection(Value: TFDConnection);

begin

  if Active then
    Close;
  FConnection := Value;
  DataBase := Value;
  if (Value <> nil) then
    Transaction := Value.Transaction
  else
    Transaction := nil;
end;


procedure TFDQuery.Open;

begin

  FOwnTransaction := not Transaction.Active;
  try
    inherited Open;
  except
    if FOwnTransaction and Transaction.Active then
      TSQLTransaction(Transaction).Rollback;
    FOwnTransaction := False;
    raise;
  end;
end;


procedure TFDQuery.Close;

begin

  inherited Close;
  if FOwnTransaction and Assigned(Transaction) and Transaction.Active then
    TSQLTransaction(Transaction).Commit;
  FOwnTransaction := False;
end;


procedure TFDQuery.ExecSQL;
var
  OwnTx: Boolean;

begin

  OwnTx := not Transaction.Active;
  try
    inherited ExecSQL;
    if OwnTx and Transaction.Active then
      TSQLTransaction(Transaction).Commit;
  except
    if OwnTx and Transaction.Active then
      TSQLTransaction(Transaction).Rollback;
    raise;
  end;
end;


destructor TFDQuery.Destroy;

begin

  Close;
  inherited;
end;

end.
