unit uControllerCadastroCliente;

interface
uses
  uIControllerCadastroCliente;
type
  TControllerCadastroCliente = class(TInterfacedObject, IControllerCadastroCliente)
    private
    public
      class function New: IControllerCadastroCliente;
      constructor Create;
      destructor Destroy; override;
      function TestarSeNomeEhValido(Nome: String): Boolean;
      function TestarSeCPFEhValido(CPF: String): Boolean;
      function TestarSeIdadeEhValida(Idade: String): Boolean;
      function TestarSeDataNascimentoEhValida(DataNascimento: String): Boolean;
  end;

implementation
uses
  uIModelCadastroCliente, uModelCadastroCliente;

{ TControllerCadastroCliente }

constructor TControllerCadastroCliente.Create;
begin

end;

destructor TControllerCadastroCliente.Destroy;
begin

  inherited;
end;

class function TControllerCadastroCliente.New: IControllerCadastroCliente;
begin
  Result := (Self.Create);
end;

function TControllerCadastroCliente.TestarSeCpfEhValido(CPF: String): Boolean;
begin
  Result := TModelCadastroCliente.New.TestarSeCPFEhValido(CPF);
end;

function TControllerCadastroCliente.TestarSeDataNascimentoEhValida(
  DataNascimento: String): Boolean;
begin
  Result := TModelCadastroCliente.New.TestarSeDataNascimentoEhValida(DataNascimento);
end;

function TControllerCadastroCliente.TestarSeIdadeEhValida(Idade: String): Boolean;
begin
  Result := TModelCadastroCliente.New.TestarSeIdadeEhValida(Idade);
end;

function TControllerCadastroCliente.TestarSeNomeEhValido(Nome: String): Boolean;
begin
  Result := TModelCadastroCliente.New.TestarSeNomeEhValido(Nome);
end;

end.
