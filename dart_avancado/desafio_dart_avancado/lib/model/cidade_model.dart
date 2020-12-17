import 'dart:convert';
import 'package:meta/meta.dart';
import 'estado_model.dart';

class CidadeModel {
  final int id;
  final String nome;
  final EstadoModel estado;
  const CidadeModel({
    @required this.id,
    @required this.nome,
    @required this.estado,
  });

  CidadeModel copyWith({
    int id,
    String nome,
    EstadoModel estado,
  }) {
    return CidadeModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      estado: estado ?? this.estado,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'UF': estado?.toMap(),
    };
  }

  factory CidadeModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CidadeModel(
      id: map['id'],
      nome: map['nome'],
      estado: EstadoModel.fromMap(map['UF']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CidadeModel.fromJson(String source) =>
      CidadeModel.fromMap(json.decode(source));

  @override
  String toString() => 'CidadeModel(id: $id, nome: $nome, estado: $estado)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CidadeModel &&
        o.id == id &&
        o.nome == nome &&
        o.estado == estado;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ estado.hashCode;
}
