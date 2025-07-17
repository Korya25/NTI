import 'package:dio/dio.dart';
import 'package:elwekala/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});

  @override
  String toString() => errorModel.message;
}

void handleDioException(DioException e) {
  ErrorModel errorModel;
  
  if (e.response != null && e.response!.data != null) {
    try {
      errorModel = ErrorModel.fromJson(e.response!.data);
    } catch (_) {
      errorModel = ErrorModel(
        status: 'error',
        message: e.message ?? 'Unknown Dio error',
      );
    }
  } else {
    errorModel = ErrorModel(
      status: 'error',
      message: _getDefaultMessageForDioException(e.type),
    );
  }
  
  throw ServerException(errorModel: errorModel);
}

String _getDefaultMessageForDioException(DioExceptionType type) {
  switch (type) {
    case DioExceptionType.connectionTimeout:
      return 'Connection timeout';
    case DioExceptionType.sendTimeout:
      return 'Send timeout';
    case DioExceptionType.receiveTimeout:
      return 'Receive timeout';
    case DioExceptionType.badCertificate:
      return 'Bad certificate';
    case DioExceptionType.cancel:
      return 'Request canceled';
    case DioExceptionType.connectionError:
      return 'Connection error';
    case DioExceptionType.unknown:
      return 'Unknown error';
    case DioExceptionType.badResponse:
      return 'Bad server response';
  }
}