program AdminChecks;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}
{$PACKENUM 1}
{$APPTYPE CONSOLE}
uses Interfaces,
SysUtils, Classes, IniFiles,
  Windows,
  FxProxy.Platform, JwaWinSvc, Forms,
  FxRecord.Config, FxRecordAdmin.Remote, frmFxRecordAdmin;

type
  TTestAdminForm = class(TfrmFxRecordAdmin)
  public
    WorkerCount: Integer;
    LastAction: TFxAdminAction;
  protected
    procedure StartWorker(AAction: TFxAdminAction; const ANewText: string); override;
  end;

  TExceptionCatcher = class
    ErrorText: string;
    procedure Handle(Sender: TObject; E: Exception);
  end;

procedure TTestAdminForm.StartWorker(AAction: TFxAdminAction; const ANewText: string);
begin
  Inc(WorkerCount);
  LastAction := AAction;
end;

procedure TExceptionCatcher.Handle(Sender: TObject; E: Exception);
begin
  ErrorText := E.ClassName + ': ' + E.Message;
  Writeln('FORM ERROR: ' + ErrorText);
  Flush(Output);
end;

procedure Require(ACondition: Boolean; const AMessage: string);
begin
  if not ACondition then raise Exception.Create(AMessage);
end;

var
  Connection: TFxAdminConnection;
  Settings, RoundTrip: TFxRecordSettings;
  Text, Updated: string;


  Form: TTestAdminForm;
  Item: TFxAdminResult;
  Failed: Boolean;
  CanClose: Boolean;
  Catcher: TExceptionCatcher;
begin
  try
  Connection.Machine := 'RADIO-SERVER';
  Connection.ConfigFile := #92#92 + 'RADIO-SERVER' + #92 + 'FxRecord' + #92 + 'FxRecord.ini';
  ValidateConnection(Connection);
  Connection.ConfigFile := #92#92 + 'OTHER-SERVER' + #92 + 'FxRecord' + #92 + 'FxRecord.ini';
  Failed := False;
  try ValidateConnection(Connection); except Failed := True; end;
  Require(Failed, 'Different-machine share must be rejected');
  Require(ConfigFileFromCommand('"C:\Radio Server\FxRecord.exe" --service --config "D:\Radio\FxRecord.ini"') =
          'D:\Radio\FxRecord.ini', 'Quoted service configuration parsing failed');
  Require(ConfigFileFromCommand('"C:\Radio Server\FxRecord.exe" --service') =
          'C:\Radio Server\FxRecord.ini', 'Default service configuration parsing failed');
  Failed := False;
  try ConfigFileFromCommand('"C:\Other\Other.exe" --service'); except Failed := True; end;
  Require(Failed, 'Other service binary must be rejected');

  Text := '[Recorder]'#13#10'StreamPath=..\FxServe\www\Stream'#13#10 +
          'ArchivePath=.\ComplianceRecordings'#13#10'[Archive]'#13#10 +
          'FragmentDuration=30'#13#10'OutputProfile=SourceCopy'#13#10 +
          '[Custom]'#13#10'KeepMe=Untouched'#13#10;
  SettingsFromText(Text, 'C:\FxRecord\FxRecord.ini', Settings);
  Require(Settings.StreamPath = '..\FxServe\www\Stream', 'Relative server stream path was changed');
  Require(Settings.ArchivePath = '.\ComplianceRecordings', 'Relative server archive path was changed');
  Require(Settings.FragmentDuration = 30, 'Archive duration was not read');
  Require(Settings.SourceMode = 'LocalFolder', 'Legacy configuration did not default to local input');
  Connection.Machine := '.';
  Connection.ConfigFile := 'C:\FxRecord\FxRecord.ini';
  ValidateConnection(Connection);
  Settings.SourceMode := 'PublicUrl';
  Settings.StreamUrl := 'https://factoryxradio.asuscomm.com/stream/live.json';
  Updated := SettingsToText(Text, Settings);
  SettingsFromText(Updated, 'C:\FxRecord\FxRecord.ini', RoundTrip);
  Require((RoundTrip.SourceMode = 'PublicUrl') and (RoundTrip.StreamUrl = Settings.StreamUrl), 'Public input settings lost');
  Settings.SourceMode := 'LocalFolder';
  Settings.OutputProfile := 'MP4-H264-AAC';
  Settings.AacSampleRate := 48000;
  Settings.AacBitRateKbps := 192;
  Updated := SettingsToText(Text, Settings);
  SettingsFromText(Updated, 'C:\FxRecord\FxRecord.ini', RoundTrip);
  Require((RoundTrip.AacSampleRate = 48000) and (RoundTrip.AacBitRateKbps = 192), 'Audio settings did not round-trip');
  Require(RoundTrip.StreamPath = Settings.StreamPath, 'Saving resolved a relative server path');
  Require(Pos('KeepMe=Untouched', Updated) > 0, 'Unknown INI setting was removed');
  RoundTrip.AacSampleRate := 32000;
  Failed := False;
  try ValidateSettings(RoundTrip); except Failed := True; end;
  Require(Failed, 'Invalid AAC settings accepted');
  Writeln('Connection validation, service command parsing and INI round-trip PASS');

  Flush(Output);
  Application.Initialize;
  Catcher := TExceptionCatcher.Create;
  Application.OnException := Catcher.Handle;
  Writeln('Creating form'); Flush(Output);
  Form := TTestAdminForm.Create(nil);
  Writeln('Form created'); Flush(Output);
  try
    Require(Catcher.ErrorText = '', 'Form raised an exception: ' + Catcher.ErrorText);
    Require(not Form.btnStart.Enabled and not Form.btnSave.Enabled, 'Disconnected commands are enabled');
    Require(not Form.RefreshTimer.Enabled, 'Disconnected form polls a server');
    Item := TFxAdminResult.Create;
    Item.Action := aaConnect;
    Item.State := SERVICE_STOPPED;
    Item.ServerConfigFile := 'C:\FxRecord\FxRecord.ini';
    Item.ConfigText := Updated;
    Form.Perform(FX_RECORD_ADMIN_RESULT, 0, LPARAM(Item));
    Form.RefreshTimer.Enabled := False;
    Require(Form.btnStart.Enabled, 'Stopped service cannot be started');
    Require(Form.btnSave.Enabled and Form.btnApply.Enabled,
      'Loaded settings unexpectedly disabled save controls');
    Require(not Form.btnStop.Enabled, 'Stopped service stop button enabled');
    Require(Form.edStreamPath.Text = '..\FxServe\www\Stream', 'Form changed relative stream path');
    Form.cbSourceMode.ItemIndex := 1;
    Form.SourceModeChanged(nil);
    Require(Form.lblStreamPath.Caption = 'HLS playlist URL', 'Public source UI did not change label');
    Form.edStreamPath.Text := 'https://factoryxradio.asuscomm.com/stream/live.json';
    Form.cbSourceMode.ItemIndex := 0;
    Form.SourceModeChanged(nil);
    Require(Form.edStreamPath.Text = '..\FxServe\www\Stream', 'Source switching lost local path');
    Form.cbSourceMode.ItemIndex := 1;
    Form.SourceModeChanged(nil);
    Require(Form.edStreamPath.Text = 'https://factoryxradio.asuscomm.com/stream/live.json', 'Source switching lost URL');
    Form.cbSourceMode.ItemIndex := 0;
    Form.SourceModeChanged(nil);
    Require(Form.cbAacRate.Enabled and not Form.cbMp3Rate.Enabled, 'AAC profile control state incorrect');
    Form.edRetentionDays.Text := '20';
    Require(Form.btnSave.Enabled and Form.btnApply.Enabled, 'Edited settings cannot be saved');
    Form.cbOutputProfile.ItemIndex := 2;
    Form.cbOutputProfileChange(nil);
    Require(Form.cbMp3Rate.Enabled and not Form.cbAacRate.Enabled, 'MP3 profile control state incorrect');
    Item := TFxAdminResult.Create;
    Item.Action := aaRefresh;
    Item.State := SERVICE_RUNNING;
    Form.Perform(FX_RECORD_ADMIN_RESULT, 0, LPARAM(Item));
    Form.RefreshTimer.Enabled := False;
    Require(Form.btnStop.Enabled and Form.btnRestart.Enabled and not Form.btnStart.Enabled,
            'Running service controls incorrect');
    Require(not Form.btnSave.Enabled and Form.btnApply.Enabled, 'Running service save guards incorrect');
    Require(Form.edRetentionDays.Text = '20', 'Refresh discarded unsaved settings');
    Form.RefreshClick(Form.RefreshTimer);
    Require(Form.WorkerCount = 1, 'Refresh did not start one worker');
    Require(Form.btnStop.Enabled and Form.btnRestart.Enabled and Form.btnRefresh.Enabled,
      'Background refresh disabled service commands');
    Form.RefreshClick(nil);
    Require(Form.WorkerCount = 1, 'Refresh clicks created overlapping workers');
    Form.RestartClick(nil);
    Require(Form.WorkerCount = 1, 'Restart overlapped the refresh worker');
    Require(not Form.btnStop.Enabled and not Form.btnRestart.Enabled,
      'Queued command allowed duplicate service commands');
    Item := TFxAdminResult.Create;
    Item.Action := aaRefresh;
    Item.State := SERVICE_RUNNING;
    Form.Perform(FX_RECORD_ADMIN_RESULT, 0, LPARAM(Item));
    Require((Form.WorkerCount = 2) and (Form.LastAction = aaRestart),
      'Queued restart was not dispatched after refresh');
    Require(not Form.btnStop.Enabled and not Form.btnRefresh.Enabled,
      'Actual service command did not disable overlapping actions');
    Item := TFxAdminResult.Create;
    Item.Action := aaRestart;
    Item.State := SERVICE_RUNNING;
    Form.Perform(FX_RECORD_ADMIN_RESULT, 0, LPARAM(Item));
    Form.RefreshTimer.Enabled := False;
    Require(Form.btnStop.Enabled and Form.btnRestart.Enabled,
      'Command completion did not restore service controls');
    Require(Form.edRetentionDays.Text = '20', 'Queued command discarded unsaved settings');
    // Stop-pending is a valid result while final conversion continues.
    Item := TFxAdminResult.Create;
    Item.Action := aaStop;
    Item.State := SERVICE_STOP_PENDING;
    Item.Notice := 'Stop accepted; finalization continues.';
    Form.Perform(FX_RECORD_ADMIN_RESULT, 0, LPARAM(Item));
    Require(Form.RefreshTimer.Enabled and Form.btnRefresh.Enabled,
      'Pending stop did not resume status refresh');
    Require(not Form.btnStart.Enabled and not Form.btnStop.Enabled and not Form.btnRestart.Enabled,
      'Pending stop allowed conflicting service commands');
    Require(Pos('finalizing', Form.lblOperation.Caption) > 0,
      'Pending stop was not displayed as finalization');
    Item := TFxAdminResult.Create;
    Item.Action := aaRefresh;
    Item.State := SERVICE_STOP_PENDING;
    Form.Perform(FX_RECORD_ADMIN_RESULT, 0, LPARAM(Item));
    Require(Pos('finalizing', Form.lblOperation.Caption) > 0,
      'Refresh cleared pending finalization status');
    Item := TFxAdminResult.Create;
    Item.Action := aaRefresh;
    Item.State := SERVICE_RUNNING;
    Form.Perform(FX_RECORD_ADMIN_RESULT, 0, LPARAM(Item));
    Form.RefreshTimer.Enabled := False;
    Form.RefreshClick(nil);
    Require(Form.btnApply.Enabled and Form.btnClose.Enabled,
      'Running-service refresh disabled Save & restart or Close');
    Form.ApplyClick(nil);
    Require(Form.WorkerCount = 3, 'Save & restart overlapped refresh');
    Item := TFxAdminResult.Create;
    Item.Action := aaRefresh;
    Item.State := SERVICE_RUNNING;
    Form.Perform(FX_RECORD_ADMIN_RESULT, 0, LPARAM(Item));
    Require((Form.WorkerCount = 4) and (Form.LastAction = aaApply),
      'Save & restart was not dispatched after refresh');
    Require(not Form.btnSave.Enabled and not Form.btnApply.Enabled and not Form.btnClose.Enabled,
      'Save command allowed another save or close');
    Form.FormCloseQuery(nil, CanClose);
    Require(not CanClose, 'Form closed during a configuration write');
    Item := TFxAdminResult.Create;
    Item.Action := aaApply;
    Item.State := SERVICE_RUNNING;
    Item.ConfigSaved := True;
    Item.ConfigText := Updated;
    Form.Perform(FX_RECORD_ADMIN_RESULT, 0, LPARAM(Item));
    Form.RefreshTimer.Enabled := False;
    Item := TFxAdminResult.Create;
    Item.Action := aaRefresh;
    Item.State := SERVICE_STOPPED;
    Form.Perform(FX_RECORD_ADMIN_RESULT, 0, LPARAM(Item));
    Form.RefreshTimer.Enabled := False;
    Form.edRetentionDays.Text := '21';
    Form.RefreshClick(nil);
    Require(Form.btnSave.Enabled and Form.btnApply.Enabled and Form.btnClose.Enabled,
      'Stopped-service refresh disabled save or close controls');
    Form.SaveClick(nil);
    Require(Form.WorkerCount = 5, 'Save (stopped) overlapped refresh');
    Item := TFxAdminResult.Create;
    Item.Action := aaRefresh;
    Item.State := SERVICE_STOPPED;
    Form.Perform(FX_RECORD_ADMIN_RESULT, 0, LPARAM(Item));
    Require((Form.WorkerCount = 6) and (Form.LastAction = aaSave),
      'Save (stopped) was not dispatched after refresh');
    Item := TFxAdminResult.Create;
    Item.Action := aaSave;
    Item.State := SERVICE_STOPPED;
    Item.ConfigSaved := True;
    Item.ConfigText := Updated;
    Form.Perform(FX_RECORD_ADMIN_RESULT, 0, LPARAM(Item));
    Form.RefreshTimer.Enabled := False;
    Form.RefreshClick(nil);
    Require(Form.btnSave.Enabled and Form.btnApply.Enabled,
      'Clean settings disabled save controls during refresh');
    Require(Form.btnClose.Enabled, 'Close is unavailable during read-only refresh');
    Form.FormCloseQuery(nil, CanClose);
    Require(not CanClose and not Form.Visible, 'Close did not hide the UI pending refresh completion');
    Form.RefreshClick(nil);
    Require(Form.WorkerCount = 7, 'Closing form started another refresh');
    Item := TFxAdminResult.Create;
    Item.Action := aaRefresh;
    Item.State := SERVICE_STOPPED;
    Form.Perform(FX_RECORD_ADMIN_RESULT, 0, LPARAM(Item));
    Require(not Form.RefreshTimer.Enabled, 'Close completion restarted polling');
    Form.FormCloseQuery(nil, CanClose);
    Require(CanClose, 'Completed refresh prevented final close');
    Require(Form.edLiveTimeout.Top + Form.edLiveTimeout.Height <= Form.Panel1.ClientHeight,
            'Live timeout exceeds form panel bounds');
    Writeln('Native form loading, refresh command/save queues, close handling and unsaved edit retention PASS');
  finally
    Form.RefreshTimer.Enabled := False;
    Form.Free;
  end;
  except
    on E: Exception do
    begin
      Writeln(E.ClassName + ': ' + E.Message);
      ExitCode := 1;
    end;
  end;
end.
