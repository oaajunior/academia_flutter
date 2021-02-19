import 'dart:io';

import 'package:shelf/shelf.dart';

//Esse arquivo é utilizado para incluir todos os middlewares criados para o
//projeto.

//A constante abaixo foi criada para declarar algumas permissoes principais para
//acesso via Rest, a primeira tag da declaração se refere a qual origem pode acessar
//o servidor, poderia colocar um ip específico ou um conjunto de ips, mas ao colocar
//um * estou informando que de qualquer lugar pode ser acessado.
//A segunda tag descreve os métodos que podem ser utilizados pelos usuários para
//acessar o servico, aí descreve basicamente todos.
//A terceira tag informa que tipo de informações podem ser trafegadas no header
//http. Basicamente conteúdos e autorizações.
const _defaultCorsHeader = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PATH, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Header':
      '${HttpHeaders.contentTypeHeader}, ${HttpHeaders.authorizationHeader}',
};

//Aqui temos a declaração de um middleware que, se não for informado uma
//configuração de hearders assumirá a constante que declarei.
//No if verifico se na requisição do usuário veio a tag opções no header
//Se veio eu respondo com status ok e retorno o que está liberado no header
//para trafegar, caso não entre no if, eu vou criar um seugndo mapa juntando
//o header que foi enviado pelo usuário mais o header que criei.
//Vou modificar o header da requisição do usuário para incluir o header que
//ele enviou mais o meu e vou processar a requisição do usuário. No final,
//vou devolver a resposta apenas com o meu header.
Middleware cors({Map<String, String> headers = _defaultCorsHeader}) {
  return (Handler innerHandler) {
    return (Request request) async {
      if (request.method == 'OPTIONS') {
        return Response(
          HttpStatus.ok,
          headers: headers,
        );
      }
      final mapHeaders = {...request?.headers, ...headers};
      final response = await innerHandler(request.change(headers: mapHeaders));

      return response.change(headers: headers);
    };
  };
}

//Esse middleware foi criado para colocar como default o tipo de content-type
//que vou trabalhar nas resposta para o usuário. Vou receber essa informação via
//parâmetro, pois caso mude de ideia futuramente, é só modificar o parâmetro.
//Em princípio o content-type que estou usando atualmente no projeto é
//'application/json;charset=utf-8', ou seja, devolver as respostas em json.
Middleware defaultResponseContentType(String contentType) {
  return (Handler innerHandler) {
    return (Request resquest) async {
      final response = await innerHandler(resquest);
      final mapHeaders = {
        ...response?.headers ?? {},
        'content-type': contentType,
      };
      return response?.change(headers: mapHeaders) ?? Response.notFound('');
    };
  };
}
