import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/core/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.nationalId,
    required super.gender,
    required super.profileImage,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json[ApiKeys.name],
      email: json[ApiKeys.email],
      phone: json[ApiKeys.phone],
      nationalId: json[ApiKeys.nationalId],
      gender: json[ApiKeys.gender],
      profileImage: json[ApiKeys.profileImage],
      token: json[ApiKeys.token],
    );
  }

   Map<String, dynamic> toJson() {
    return {
      ApiKeys.name: name,
      ApiKeys.email: email,
      ApiKeys.phone: phone,
      ApiKeys.nationalId: nationalId,
      ApiKeys.gender: gender,
      ApiKeys.profileImage: profileImage,
      ApiKeys.token: token,
    };
  }
}
