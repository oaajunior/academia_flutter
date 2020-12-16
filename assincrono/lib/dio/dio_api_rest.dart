import 'package:dio/dio.dart';

//Aqui eu anotei somente a parte do Dio que nao conhecia que é o conceito de
//Interceptor, onde eu posso realizar acoes antes da requisicao http, quando
//receber a resposta e/ou quando houver um erro.
void doInterceptorTest() {
  print('------------------Interceptors-------------------');
  var dio = Dio();
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (request) {
      print('onRequest');
    },
    onResponse: (response) {
      print('onResponse');
    },
    onError: (error) {
      print('onERror');
    },
  ));
}
