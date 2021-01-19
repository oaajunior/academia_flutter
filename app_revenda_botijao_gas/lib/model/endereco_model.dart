import 'dart:convert';

class Endereco {
  String logradouro = '';
  String numero = '';
  String complemento = '';
  String bairro = '';
  String cidade = '';
  String estado = '';
  Endereco({
    this.logradouro,
    this.numero,
    this.complemento,
    this.bairro,
    this.cidade,
    this.estado,
  });

  Endereco copyWith({
    String logradouro,
    String numero,
    String complemento,
    String bairro,
    String cidade,
    String estado,
  }) {
    return Endereco(
      logradouro: logradouro ?? this.logradouro,
      numero: numero ?? this.numero,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'logradouro': logradouro,
      'numero': numero,
      'complemento': complemento,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Endereco(
      logradouro: map['logradouro'],
      numero: map['numero'],
      complemento: map['complemento'],
      bairro: map['bairro'],
      cidade: map['cidade'],
      estado: map['estado'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Endereco.fromJson(String source) =>
      Endereco.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Endereco(logradouro: $logradouro, numero: $numero, complemento: $complemento, bairro: $bairro, cidade: $cidade, estado: $estado)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Endereco &&
        o.logradouro == logradouro &&
        o.numero == numero &&
        o.complemento == complemento &&
        o.bairro == bairro &&
        o.cidade == cidade &&
        o.estado == estado;
  }

  @override
  int get hashCode {
    return logradouro.hashCode ^
        numero.hashCode ^
        complemento.hashCode ^
        bairro.hashCode ^
        cidade.hashCode ^
        estado.hashCode;
  }
}
