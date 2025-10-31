//importe necessário do material app

class Cliente {
  final String nome;
  final String email;
  final String senha;

  //construtor do cliente

  Cliente({
    required this.nome,
    required this.email,
    required this.senha,
  });
  @override
  String toString() {
    return 'Cliente: $nome, Email: $email';
  }
}

class GerenciadorClientes{
  //variavel estática que guarda a unica cópia desta classe
  static final GerenciadorClientes _instancia = GerenciadorClientes._interno();
  //impede a criação de novas instancias
  GerenciadorClientes._interno();
  //sempre retorna a instancia existente 
  factory GerenciadorClientes() => _instancia;
  //lista <ul> que armazena todos os clietes cadastrados
  final List<Cliente> _clientes = [];
  //para acessar a lista de clientes (retorna uma cópia imutável)
  List<Cliente> get clientes => List.unmodifiable(_clientes);
  //Tentar cadastrar um cliente novo
  bool cadastrar(Cliente cliente) {
    //vamos checar se ja existe um email cadastrado
    if(_clientes.any((c) => c.email.toLowerCase() == cliente.email.toLowerCase())){
      print('Erro: email ${cliente.email} já cadastrado');
      return false;
    }
    _clientes.add(cliente); //Adicionar um cliente
    print('Novo cliente cadastrado: ${cliente.nome}');
    return true; //Cadastrouuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
  }

  Cliente ? login(String email, String senha) {
    return _clientes.firstWhere(
      //é uma função anônima 
      //o c representa cada elemento(cada cliente) da lista _clientes
      (c) => c.email.toLowerCase() == email.toLowerCase() && c.senha == senha,
      orElse: () => Null as Cliente, //retorna nulo se não encontrar os dados
    );
  }

}