import 'package:dartz/dartz.dart';
import 'package:elwekala/core/errors/exceptions.dart';
import 'package:elwekala/features/auth/data/dataSources/auth_local_data_source.dart';
import 'package:elwekala/features/auth/data/dataSources/auth_remote_data_source.dart';
import 'package:elwekala/core/domain/entities/user_entity.dart';
import 'package:elwekala/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
    final AuthLocalDataSource localDataSource;


  AuthRepositoryImpl({required this.localDataSource,required this.remoteDataSource});
  @override
  Future<Either<String, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final model = await remoteDataSource.login(
        email: email,
        password: password,
      );
      return Right(model.user);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  @override
  Future<Either<String, UserEntity>> register({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
    required String profileImage,
  }) async {
    try {
      final model = await remoteDataSource.register(
        name: name,
        email: email,
        phone: phone,
        nationalId: nationalId,
        gender: gender,
        password: password,
        profileImage: profileImage,
      );

      return Right(model.user);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  @override
  Future<void> saveToken(String token) async {
    await localDataSource.cacheToken(token);
  }

  @override
  String? getToken() {
    return localDataSource.getCachedToken();
  }

  @override
  Future<void> logout() async {
    await localDataSource.clearToken();
  }
}
