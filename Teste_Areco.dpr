program Teste_Areco;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fmMain},
  uTProduto in 'uTProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
