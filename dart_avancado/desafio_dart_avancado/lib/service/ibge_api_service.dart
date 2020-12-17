import 'dart:io';

import 'package:desafio_dart_avancado/model/cidade_model.dart';
import 'package:desafio_dart_avancado/model/estado_model.dart';
import 'package:dio/dio.dart';

abstract class IBGEApiService {
  Future<List<EstadoModel>> getEstados();
  Future<List<CidadeModel>> getCidades(int idEstado);
}

class IBGEApiServiceImpl implements IBGEApiService {
  final Dio _dio = Dio();

  @override
  Future<List<CidadeModel>> getCidades(int idEstado) async {
    final URL =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$idEstado/distritos';

    var cidadeList = <CidadeModel>[];
    try {
      var response = await _dio.get(URL);
      if (response.statusCode != 200) {
        throw HttpException(response.statusMessage, uri: response.realUri);
      }
      if (response.data != null && response.data.length > 0) {
        var cidades = response.data as List<dynamic>;
        cidades.forEach((cidade) {
          cidadeList.add(CidadeModel.fromMap(cidade));
        });
      } else {
        throw HttpException('A lista de municípios do IBGE está vazia',
            uri: response.realUri);
      }
      return cidadeList;
    } on HttpException catch (_) {
      rethrow;
    } on DioError catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(
          'Houve um erro desconhecido ao tentar consultar as cidades na API do IBGE');
    }
  }

  @override
  Future<List<EstadoModel>> getEstados() async {
    const URL = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    var estadoList = <EstadoModel>[];
    try {
      var response = await _dio.get(URL);
      if (response.statusCode != 200) {
        throw HttpException(response.statusMessage, uri: response.realUri);
      }
      if (response.data != null && response.data.length > 0) {
        var estados = response.data as List<dynamic>;
        estados.forEach((estado) {
          estadoList.add(EstadoModel.fromMap(estado));
        });
      } else {
        throw HttpException('A lista de estados do IBGE está vazia',
            uri: response.realUri);
      }
      return estadoList;
    } on HttpException catch (_) {
      rethrow;
    } on DioError catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(
          'Houve um erro desconhecido ao tentar consultar os estados na API do IBGE');
    }
  }
}
