import 'dart:convert';
import 'package:meta/meta.dart';

class EstadoModel {
  final int id;
  final String sigla;
  final String nome;
  const EstadoModel({
    @required this.id,
    @required this.sigla,
    @required this.nome,
  });

  EstadoModel copyWith({
    int id,
    String sigla,
    String nome,
  }) {
    return EstadoModel(
      id: id ?? this.id,
      sigla: sigla ?? this.sigla,
      nome: nome ?? this.nome,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sigla': sigla,
      'nome': nome,
    };
  }

  factory EstadoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EstadoModel(
      id: map['id'],
      sigla: map['sigla'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EstadoModel.fromJson(String source) =>
      EstadoModel.fromMap(json.decode(source));

  @override
  String toString() => 'EstadoModel(id: $id, sigla: $sigla, nome: $nome)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EstadoModel && o.id == id && o.sigla == sigla && o.nome == nome;
  }

  @override
  int get hashCode => id.hashCode ^ sigla.hashCode ^ nome.hashCode;
}
