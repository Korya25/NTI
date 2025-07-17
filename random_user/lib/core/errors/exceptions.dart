import 'package:dio/dio.dart';
import 'error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});

}

void handleDioException(DioException e) {
  final int? statusCode = e.response?.statusCode;

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.unknown:
      throw ServerException(
        errorModel: ErrorModel(
          message: e.message ?? 'Network error occurred',
          statusCode: statusCode ?? 0,
        ),
      );

    case DioExceptionType.badResponse:
      final dynamic data = e.response?.data;

      if (data is Map<String, dynamic>) {
        throw ServerException(
          errorModel: ErrorModel.fromJson(data),
        );
      } else if (data is String) {
        throw ServerException(
          errorModel: ErrorModel(
            message: data,
            statusCode: statusCode ?? 0,
          ),
        );
      } else {
        throw ServerException(
          errorModel: ErrorModel(
            message: 'Unexpected server error',
            statusCode: statusCode ?? 0,
          ),
        );
      }
  }
}
