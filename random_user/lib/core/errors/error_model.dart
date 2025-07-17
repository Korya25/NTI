import 'package:api_task/core/api/end_point.dart';

class ErrorModel {
  final String message;
  final int statusCode;

  const ErrorModel({
    required this.message,
    required this.statusCode,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json[ApiKeys.message] ?? 'Unexpected error occurred',
      statusCode: json[ApiKeys.statusCode] is int
          ? json[ApiKeys.statusCode]
          : int.tryParse(json[ApiKeys.statusCode]?.toString() ?? '0') ?? 0,
    );
  }

}
