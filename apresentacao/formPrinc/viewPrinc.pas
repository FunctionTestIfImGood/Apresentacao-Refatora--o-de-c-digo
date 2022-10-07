unit viewPrinc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uIGuardaObjetoCliente;

type
  TForm2 = class(TForm)
    gpCliente: TGroupBox;
    edtNome: TLabeledEdit;
    edtIdade: TLabeledEdit;
    edtCPF: TLabeledEdit;
    Button1: TButton;
    memoDados: TMemo;
    edtDataNascimento: TLabeledEdit;
    Button2: TButton;
    labelStatus: TLabel;
    labelStatusFinal: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure edtIdadeExit(Sender: TObject);
    procedure edtCPFExit(Sender: TObject);
    procedure edtDataNascimentoExit(Sender: TObject);
    procedure edtCPFChange(Sender: TObject);
  private
    { Private declarations }
    FoObjCliente: IGuardaObjetoCliente;
    procedure DefiniriStatusLabelAbort;
    procedure DefinirStatusLabelSucesso;
    procedure RedefinirLabel;
    procedure ValidarNome(ObjetoCliente: IGuardaObjetoCliente);
    procedure ValidarIdade(ObjetoCliente: IGuardaObjetoCliente);
    procedure ValidaCPF(ObjetoCliente: IGuardaObjetoCliente);
    Procedure ValidarDataNascimento(ObjetoCliente: IGuardaObjetoCliente);
    procedure Validacoes(ObjetoCliente: IGuardaObjetoCliente);
    procedure AdicionarDadosMemo(ObjetoCliente: IGuardaObjetoCliente);
    function AlimentarObjetoCliente: IGuardaObjetoCliente;
    procedure RedefinirCorComponentes;
    procedure LimparComponentes;
    procedure AjustarCorComponenteDataNascimento;
    procedure MontarMensagemComAbort(AMensagem: String);
    procedure AjustarCorComponenteCPF;
    procedure AjustarCorComponenteCPFOnChange;
    procedure DeletarDadosMemo;
    procedure AjustarCorComponenteIdade;
    procedure AjustarCorComponenteNome;
    procedure validarNomeProcedure;
    procedure ValidarIDadeProcedure;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses
 uIControllerCadastroCliente, 
 uControllerCadastroCliente, 
 uGuardaObjetoCliente,
 uResourceStringCadCliente;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
const
  _nNumeroMaximoCpf = 11;
var
  oObjetoCliente: IGuardaObjetoCliente;
begin
  oObjetoCliente :=  Self.AlimentarObjetoCliente;
  Self.Validacoes(oObjetoCliente);
  Self.AdicionarDadosMemo(oObjetoCliente);
  Self.DefinirStatusLabelSucesso;


 { Self.validarNomeProcedure;
  Self.ValidarIDadeProcedure;

  if (edtIdade.Text = EmptyStr) then
    begin
    labelStatusFinal.Font.Color := clRed;
    labelStatusFinal.Caption  := 'Contém inconsistências no cadastro.';
    showMessage('Digite a idade!');
    Abort;
  end;


  if (edtCPF.Text = EmptyStr) or (Length(edtCpf.Text) <> _nNumeroMaximoCpf) then
    begin
    labelStatusFinal.Font.Color := clRed;
    labelStatusFinal.Caption  := 'Contém inconsistências no cadastro.';
    showMessage('Digite o cpf/Digite um cpf válido!');
    Abort;
  end;

  if (edtDataNascimento.Text = EmptyStr) then
    begin
     labelStatusFinal.Font.Color := clRed;
     labelStatusFinal.Caption  := 'Contém inconsistências no cadastro.';
    showMessage('Digite a data de nascimento!');
    Abort;
  end;

  memoDados.Lines.Add('Nome: ' + edtNome.Text + SLineBreak +
                      'Idade: ' + edtIdade.Text + SLineBreak +
                      'CPF: ' + edtCPF.Text + SLineBreak +
                      'Data de nascimento: ' + edtDataNascimento.Text);  


  labelStatusFinal.Font.Color := clGreen;
  labelStatusFinal.Caption  := uResourceStringCadCliente.StrCadastradoComSucesso;}

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Self.DeletarDadosMemo;
  Self.LimparComponentes;
  Self.RedefinirCorComponentes;
  Self.RedefinirLabel;   
end;

procedure TForm2.edtCPFChange(Sender: TObject);
begin
  Self.AjustarCorComponenteCPFOnChange;
end;

procedure TForm2.edtCPFExit(Sender: TObject);
begin
  Self.AjustarCorComponenteCPF;
end;

procedure TForm2.edtDataNascimentoExit(Sender: TObject);
begin
  Self.AjustarCorComponenteDataNascimento;
end;

procedure TForm2.AdicionarDadosMemo(ObjetoCliente: IGuardaObjetoCliente);
begin
  memoDados.Lines.Add(uResourceStringCadCliente.StrNome           + ObjetoCliente.GetNome  +
                      uResourceStringCadCliente.StrIdade          + ObjetoCliente.GetIdade +
                      uResourceStringCadCliente.StrCPF            + ObjetoCliente.GetCPF +
                      uResourceStringCadCliente.StrDataNascimento + ObjetoCliente.GetDataNascimento);
end;

function TForm2.AlimentarObjetoCliente: IGuardaObjetoCliente;
begin
  Result := TGuardaObjetoCliente.New
                        .SetNome(edtNome.Text)
                        .SetIdade(edtIdade.Text)
                        .SetCPF(edtCPF.Text)
                        .SetDataNascimento(edtDataNascimento.Text);
end;

procedure TForm2.AjustarCorComponenteDataNascimento;
begin
  if edtDataNascimento.Text = EmptyStr then
    edtDataNascimento.Color := clRed
  else
    edtDataNascimento.Color := clWhite;
end;

procedure TForm2.AjustarCorComponenteCPF;
begin
  if (edtCPF.Text = EmptyStr) or (Length(edtCpf.Text) <> 11) then
    edtCPF.Color := clRed
  else
    edtCPF.Color := clWhite;
end;

procedure TForm2.AjustarCorComponenteCPFOnChange;
begin
  edtCPF.Color := clRed;
  if (Length(edtCPF.Text) = 11) then
    edtCPF.Color := clWhite;
//  if (Length(edtCPF.Text) <> 11) then
//    edtCPF.Color := clRed
//  else
//    edtCPF.Color := clWhite;
end;

procedure TForm2.DefiniriStatusLabelAbort;
begin
  labelStatusFinal.Font.Color := clRed;
  labelStatusFinal.Caption  := uResourceStringCadCliente.StrCadastradoComErro;
end;

procedure TForm2.DefinirStatusLabelSucesso;
begin
  labelStatusFinal.Font.Color := clGreen;
  labelStatusFinal.Caption  := uResourceStringCadCliente.StrCadastradoComSucesso;
end;

procedure TForm2.DeletarDadosMemo;
begin
  if (memoDados.Lines.Text <> EmptyStr) then
    memoDados.Clear;
end;

procedure TForm2.AjustarCorComponenteIdade;
begin
  if edtIdade.Text = EmptyStr then
    edtIdade.Color := clRed
  else
    edtIdade.Color := clWhite;
end;

procedure TForm2.AjustarCorComponenteNome;
begin
  if edtNome.Text = EmptyStr then
    edtNome.Color := clRed
  else
    edtNome.Color := clWhite;
end;

procedure TForm2.validarNomeProcedure;
begin
 
  if (edtNome.Text = EmptyStr) then
  begin
    labelStatusFinal.Font.Color := clRed;
    labelStatusFinal.Caption := 'Contém inconsistências no cadastro.';
    showMessage('Digite um nome!');
    Abort;
  end;
end;

procedure TForm2.edtIdadeExit(Sender: TObject);
begin
  Self.AjustarCorComponenteIdade;    
end;

procedure TForm2.edtNomeExit(Sender: TObject);
begin
  Self.AjustarCorComponenteNome;
end;

procedure TForm2.LimparComponentes;
begin
  edtNome.Clear;
  edtIdade.Clear;
  edtCPF.Clear;
  edtDataNascimento.Clear;
end;

procedure TForm2.MontarMensagemComAbort(AMensagem: String);
begin
//  Self.DefiniriStatusLabelAbort;
  Vcl.Dialogs.ShowMessage(AMensagem);
  Abort;
end;

procedure TForm2.RedefinirCorComponentes;
begin
  edtNome.Color           := clWhite;
  edtIdade.Color          := clWhite;
  edtCPF.Color            := clWhite;
  edtDataNascimento.Color := clWhite;
end;

procedure TForm2.RedefinirLabel;
begin
  labelStatusFinal.Caption := EmptyStr;
end;

procedure TForm2.Validacoes(ObjetoCliente: IGuardaObjetoCliente);
begin
  Self.ValidarNome(ObjetoCliente);
  Self.ValidarIdade(ObjetoCliente);
  Self.ValidaCPF(ObjetoCliente);
  Self.ValidarIdade(ObjetoCliente);
end;

procedure TForm2.ValidaCPF(ObjetoCliente: IGuardaObjetoCliente);
var
  oControllerCliente: IControllerCadastroCliente;
begin
  oControllerCliente := TControllerCadastroCliente.New;
  if (oControllerCliente.TestarSeCPFEhValido(ObjetoCliente.GetCPF)) then
    Exit;

  Self.DefiniriStatusLabelAbort; 
  Self.MontarMensagemComAbort(uResourceStringCadCliente.StrCPFInvalido); 
end;

procedure TForm2.ValidarDataNascimento(ObjetoCliente: IGuardaObjetoCliente);
var
  oControllerCliente: IControllerCadastroCliente;
begin
  oControllerCliente := TControllerCadastroCliente.New;
  if (oControllerCliente.TestarSeDataNascimentoEhValida(ObjetoCliente.GetDataNascimento)) then
    Exit;

  Self.DefiniriStatusLabelAbort;  
  Self.MontarMensagemComAbort(uResourceStringCadCliente.StrDataNascimentoInvalida);
end;

procedure TForm2.ValidarIdade(ObjetoCliente: IGuardaObjetoCliente);
var
  oControllerCliente: IControllerCadastroCliente;
begin
  oControllerCliente := TControllerCadastroCliente.New;

  if (oControllerCliente.TestarSeIdadeEhValida(ObjetoCliente.GetIdade)) then
    Exit;

  Self.DefiniriStatusLabelAbort;
  Self.MontarMensagemComAbort(uResourceStringCadCliente.StrIdadeInvalida);
end;

procedure TForm2.ValidarIDadeProcedure;
begin
  if (edtIdade.Text = EmptyStr) then
    begin
    labelStatusFinal.Font.Color := clRed;
    labelStatusFinal.Caption  := 'Contém inconsistências no cadastro.';
    showMessage('Digite a idade!');
    Abort;
  end;
end;

procedure TForm2.ValidarNome(ObjetoCliente: IGuardaObjetoCliente);
var
  oControllerCliente: IControllerCadastroCliente;
begin
  oControllerCliente := TControllerCadastroCliente.New;

  if (oControllerCliente.TestarSeNomeEhValido(ObjetoCliente.GetNome)) then
    Exit;

  Self.DefiniriStatusLabelAbort;
  Self.MontarMensagemComAbort(uResourceStringCadCliente.StrNomeInvalido);
end;

end.
