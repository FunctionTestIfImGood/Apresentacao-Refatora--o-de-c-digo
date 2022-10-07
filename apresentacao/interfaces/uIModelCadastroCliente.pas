unit uIModelCadastroCliente;

interface
type
  IModelCadastroCliente = interface
    ['{1A1561E7-20EA-4502-8680-0CCB86BE4F8B}']
     function TestarSeNomeEhValido(Nome: String): Boolean;
     function TestarSeCPFEhValido(CPF: String): Boolean;
     function TestarSeIdadeEhValida(Idade: String): Boolean;
     function TestarSeDataNascimentoEhValida(DataNascimento: String): Boolean;
  end;

implementation

end.
