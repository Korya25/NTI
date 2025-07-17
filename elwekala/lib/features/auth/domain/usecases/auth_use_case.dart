import 'package:dartz/dartz.dart';
import 'package:elwekala/core/domain/entities/user_entity.dart';
import 'package:elwekala/features/auth/domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase(this.repository);

  // login method
  Future<Either<String, UserEntity>> login({
    required String email,
    required String password,
  }) {
    return repository.login(email: email, password: password);
  }

  Future<Either<String, UserEntity>> register({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
    required String profileImage,
  }) async {
    return repository.register(
      name: name,
      email: email,
      phone: phone,
      nationalId: nationalId,
      gender: gender,
      password: password,
      profileImage: profileImage,
    );
  }

  Future<void> saveToken(String token) async {
    await repository.saveToken(token);
  }
}
