import 'package:dartz/dartz.dart';
import 'package:elwekala/core/domain/entities/user_entity.dart';
import 'package:elwekala/features/profile/domain/entities/update_profile_data.dart';

abstract class ProfileRepo {
  Future<Either<String, UserEntity>> getProfile({required String token});

  Future<Either<String, UpdateProfileDataEntity>> updateProfile({
    required String token,
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
  });

  Future<Either<String, String>> deleteProfile({
    required String token,
    required String email,
  });
}
