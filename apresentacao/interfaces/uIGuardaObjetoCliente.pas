unit uIGuardaObjetoCliente;

interface
type
  IGuardaObjetoCliente = interface
    ['{F55A6A2C-7F98-4592-9692-574C9ACA2E26}']
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

end.
