import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/core/data/models/user_model.dart';

class AuthModel {
  final String status;
  final String message;
  final UserModel user;

  AuthModel({required this.status, required this.message, required this.user});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      status: json[ApiKeys.status],
      message: json[ApiKeys.message],
      user: UserModel.fromJson(json[ApiKeys.user]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.status: status,
      ApiKeys.message: message,
      ApiKeys.user: user.toJson(),
    };
  }
}
