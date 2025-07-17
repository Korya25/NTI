import 'package:dartz/dartz.dart';
import 'package:elwekala/core/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<String, UserEntity>> login({
    required String email,
    required String password,
  });
  Future<void> saveToken(String token);
  String? getToken();
  Future<void> logout();

  Future<Either<String, UserEntity>> register({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
    required String profileImage,
  });
}
