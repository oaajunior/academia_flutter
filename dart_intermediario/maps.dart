void main(List<String> args) {
  var dadosCliente = {
    'nome': 'Oberdan',
    'endereço': {'logradouro': 'Estrada do lutero', 'bairro': 'Paisagem Renoir'}
  };

  print((dadosCliente['endereço'] as Map)['logradouro']);
}
