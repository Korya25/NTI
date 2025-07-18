import 'package:dio/dio.dart';

class DioClient {
  static const String baseUrl = 'https://pokeapi.co/api/v2/';
  
  late final Dio _dio;
  
  DioClient() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
  }
  
  Dio get dio => _dio;
}
