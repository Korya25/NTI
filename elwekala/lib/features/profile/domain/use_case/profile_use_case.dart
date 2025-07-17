import 'package:dartz/dartz.dart';
import 'package:elwekala/core/domain/entities/user_entity.dart';
import 'package:elwekala/features/profile/domain/entities/update_profile_data.dart';
import 'package:elwekala/features/profile/domain/repo/profile_repo.dart';

class ProfileUseCase {
  final ProfileRepo repo;

  ProfileUseCase(this.repo);

  Future<Either<String, UserEntity>> getProfile({required String token}) async {
    return repo.getProfile(token: token);
  }

  Future<Either<String, UpdateProfileDataEntity>> updateProfile({
    required String token,
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
  }) async {
    return repo.updateProfile(
      token: token,
      name: name,
      email: email,
      phone: phone,
      gender: gender,
      password: password,
    );
  }

  Future<Either<String, String>> deleteProfile({
    required String token,
    required String email,
  }) async {
    return repo.deleteProfile(token: token, email: email);
  }
}
