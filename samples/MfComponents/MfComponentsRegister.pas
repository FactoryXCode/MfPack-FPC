unit MfComponentsRegister;
{$mode delphiunicode}
interface

procedure Register;

implementation

uses
  QueueTimer,
  ThreadedQueueTimer,
  MfGuiRefreshTimer,
  MfPeakMeterEx,
  MfPeakMeter,
  MfPeakMeterMmcs,
  MfAudioVisualizer,
  MfAudioMixVisualizer,
  MfFlangerEchoComponent,
  MfParametricEqComponent,
  MfCompressorLimiterComponent,
  MfChorusComponent,
  MfLowMidHighEqComponent,
  MfAudioEndPoint,
  MfWasApiPlayerEngineComponent,
  MfPitchTempoComponent,
  MfWasApiEffectsRack,
  MfFxEditors;


procedure Register;

begin

  QueueTimer.Register;
  ThreadedQueueTimer.Register;
  MfGuiRefreshTimer.Register;
  MfPeakMeterEx.Register;
  MfPeakMeter.Register;
  MfPeakMeterMmcs.Register;
  MfAudioVisualizer.Register;
  MfAudioMixVisualizer.Register;
  MfFlangerEchoComponent.Register;
  MfParametricEqComponent.Register;
  MfCompressorLimiterComponent.Register;
  MfChorusComponent.Register;
  MfLowMidHighEqComponent.Register;
  MfAudioEndPoint.Register;
  MfWasApiPlayerEngineComponent.Register;
  MfPitchTempoComponent.Register;
  MfWasApiEffectsRack.Register;
  MfFxEditors.Register;
end;

end.
