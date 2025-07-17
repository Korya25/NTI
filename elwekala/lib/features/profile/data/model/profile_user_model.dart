import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/core/data/models/user_model.dart';

class ProfileResponseModel {
  final String status;
  final String? message;
  final UserModel user;

  ProfileResponseModel({
    required this.status,
    required this.message,
    required this.user,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      status: json[ApiKeys.status],
      message: json[ApiKeys.message],
      user: UserModel.fromJson(json[ApiKeys.user]),
    );
  }
}
