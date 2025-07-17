
import 'package:elwekala/features/profile/domain/entities/update_profile_data.dart';


class UpdateUserResponse {
  final String status;
  final String message;
  final UpdateProfileDataModel user;

  UpdateUserResponse({
    required this.status,
    required this.message,
    required this.user,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserResponse(
      status: json['status'],
      message: json['message'],
      user: UpdateProfileDataModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'user': user.toJson(),
    };
  }
}


class UpdateProfileDataModel extends UpdateProfileDataEntity {
  const UpdateProfileDataModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.gender,
    required super.password,
  });

  factory UpdateProfileDataModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileDataModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'password': password,
    };
  }
}
