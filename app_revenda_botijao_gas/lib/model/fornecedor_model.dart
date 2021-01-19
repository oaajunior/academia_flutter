import 'dart:convert';

class Fornecedor {
  String tipo;
  String nome;
  String cor;
  double nota;
  String tempoMedio;
  bool melhorPreco;
  double preco;
  Fornecedor({
    this.tipo,
    this.nome,
    this.cor,
    this.nota,
    this.tempoMedio,
    this.melhorPreco,
    this.preco,
  });

  Fornecedor copyWith({
    String tipo,
    String nome,
    String cor,
    String nota,
    String tempoMedio,
    String melhorPreco,
    String preco,
  }) {
    return Fornecedor(
      tipo: tipo ?? this.tipo,
      nome: nome ?? this.nome,
      cor: cor ?? this.cor,
      nota: nota ?? this.nota,
      tempoMedio: tempoMedio ?? this.tempoMedio,
      melhorPreco: melhorPreco ?? this.melhorPreco,
      preco: preco ?? this.preco,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'nome': nome,
      'cor': cor,
      'nota': nota,
      'tempoMedio': tempoMedio,
      'melhorPreco': melhorPreco,
      'preco': preco,
    };
  }

  factory Fornecedor.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Fornecedor(
      tipo: map['tipo'],
      nome: map['nome'],
      cor: map['cor'],
      nota: map['nota'],
      tempoMedio: map['tempoMedio'],
      melhorPreco: map['melhorPreco'],
      preco: map['preco'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Fornecedor.fromJson(String source) =>
      Fornecedor.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Fornecedor(tipo: $tipo, nome: $nome, cor: $cor, nota: $nota, tempoMedio: $tempoMedio, melhorPreco: $melhorPreco, preco: $preco)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Fornecedor &&
        o.tipo == tipo &&
        o.nome == nome &&
        o.cor == cor &&
        o.nota == nota &&
        o.tempoMedio == tempoMedio &&
        o.melhorPreco == melhorPreco &&
        o.preco == preco;
  }

  @override
  int get hashCode {
    return tipo.hashCode ^
        nome.hashCode ^
        cor.hashCode ^
        nota.hashCode ^
        tempoMedio.hashCode ^
        melhorPreco.hashCode ^
        preco.hashCode;
  }
}
