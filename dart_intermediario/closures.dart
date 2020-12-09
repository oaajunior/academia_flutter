List<int> filtrar(List<int> lista, bool filtro(int a)) {
  List<int> novaLista = [];
  for (var item in lista) {
    if (filtro(item)) {
      novaLista.add(item);
    }
  }
  return novaLista;
}

bool numerosPares(int numero) => numero % 2 == 0;

void main(List<String> args) {
  var lista = List.generate(10, (i) => i);

  print(filtrar(lista, numerosPares));
}
