unit uIControllerCadastroCliente;

interface
type
  IControllerCadastroCliente = interface
    ['{2AD95D37-4110-4DAF-A157-C10FB0E4BE51}']
    function TestarSeNomeEhValido(Nome: String): Boolean;
    function TestarSeCPFEhValido(CPF: String): Boolean;
    function TestarSeIdadeEhValida(Idade: String): Boolean;
    function TestarSeDataNascimentoEhValida(DataNascimento: String): Boolean;
  end;

implementation

end.
