program Project2;

uses
  Vcl.Forms,
  viewPrinc in 'formPrinc\viewPrinc.pas' {Form2},
  uIGuardaObjetoCliente in 'interfaces\uIGuardaObjetoCliente.pas',
  uGuardaObjetoCliente in 'classes\uGuardaObjetoCliente.pas',
  uIControllerCadastroCliente in 'interfaces\uIControllerCadastroCliente.pas',
  uControllerCadastroCliente in 'classes\uControllerCadastroCliente.pas',
  uIModelCadastroCliente in 'interfaces\uIModelCadastroCliente.pas',
  uModelCadastroCliente in 'classes\uModelCadastroCliente.pas',
  uResourceStringCadCliente in 'resourcestring\uResourceStringCadCliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
