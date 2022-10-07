unit uModelCadastroCliente;

interface
uses
  uIModelCadastroCliente;
type
  TModelCadastroCliente = class(TInterfacedObject, IModelCadastroCliente)
    private
    public
      class function New: IModelCadastroCliente;
      constructor Create;
      destructor Destroy; override;
      function TestarSeNomeEhValido(Nome: String): Boolean;
      function TestarSeCPFEhValido(CPF: String): Boolean;
      function TestarSeIdadeEhValida(Idade: String): Boolean;
      function TestarSeDataNascimentoEhValida(DataNascimento: String): Boolean;
  end;

implementation
uses
  SysUtils, Vcl.Dialogs;

{ TModelCadastroCliente }

constructor TModelCadastroCliente.Create;
begin

end;

destructor TModelCadastroCliente.Destroy;
begin

  inherited;
end;

class function TModelCadastroCliente.New: IModelCadastroCliente;
begin
  Result := (Self.Create);
end;

function TModelCadastroCliente.TestarSeCPFEhValido(CPF: String): Boolean;
begin
  Result := (CPF <> EmptyStr) or (Length(CPF) = 11);
end;

function TModelCadastroCliente.TestarSeDataNascimentoEhValida(DataNascimento: String): Boolean;
begin
  Result := (DataNascimento <> EmptyStr);
end;

function TModelCadastroCliente.TestarSeIdadeEhValida(Idade: String): Boolean;
begin
  Result := (Idade <> EmptyStr);
end;

function TModelCadastroCliente.TestarSeNomeEhValido(Nome: String): Boolean;
begin
  Result := (Nome <> EmptyStr);
end;

end.
