unit uGuardaObjetoCliente;

interface
uses
  uIGuardaObjetoCliente;
type
  TGuardaObjetoCliente = class(TInterfacedObject, IGuardaObjetoCliente)
    private
      FNome: String;
      FIdade: String;
      FCPF: String;
      FDataNascimento: String;
    public
      class Function New: IGuardaObjetoCliente;
      constructor Create;
      destructor Destroy; Override;
      function SetNome(Nome: String): IGuardaObjetoCliente;
      function SetIdade(Idade: String): IGuardaObjetoCliente;
      function SetCPF(CPF: String): IGuardaObjetoCliente;
      function SetDataNascimento(DataNascimento: String): IGuardaObjetoCliente;
      function GetNome: String;
      function GetIdade: String;
      function GetCPF: String;
      function GetDataNascimento: String;
  end;

implementation

{ TGuardaObjetoCliente }

constructor TGuardaObjetoCliente.Create;
begin

end;

destructor TGuardaObjetoCliente.Destroy;
begin

  inherited;
end;

function TGuardaObjetoCliente.GetCPF: String;
begin
  Result := FCPF;
end;

function TGuardaObjetoCliente.GetDataNascimento: String;
begin
  Result := FDataNascimento;
end;

function TGuardaObjetoCliente.GetIdade: String;
begin
  Result := FIdade;
end;

function TGuardaObjetoCliente.GetNome: String;
begin
  Result := FNome;
end;

class function TGuardaObjetoCliente.New: IGuardaObjetoCliente;
begin
  Result := (Self.Create);
end;

function TGuardaObjetoCliente.SetCPF(CPF: String): IGuardaObjetoCliente;
begin
  Result := Self;
  FCPF := CPF;
end;

function TGuardaObjetoCliente.SetDataNascimento(
  DataNascimento: String): IGuardaObjetoCliente;
begin
  Result := Self;
  FDataNascimento := DataNascimento;
end;

function TGuardaObjetoCliente.SetIdade(Idade: String): IGuardaObjetoCliente;
begin
  Result := Self;
  FIdade := Idade;
end;

function TGuardaObjetoCliente.SetNome(Nome: String): IGuardaObjetoCliente;
begin
  Result := Self;
  FNome := Nome;

end;

end.
