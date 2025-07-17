import 'package:elwekala/core/api/end_points.dart';

class ErrorModel {
  final dynamic status;
  final String message;

  ErrorModel({this.status, required this.message,});
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      status: json[ApiKeys.status].toString(),
      message: json[ApiKeys.message].toString() 
    );
  }
}
