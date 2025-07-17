import 'package:dartz/dartz.dart';
import 'package:elwekala/core/domain/entities/user_entity.dart';
import 'package:elwekala/core/errors/exceptions.dart';
import 'package:elwekala/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:elwekala/features/profile/domain/entities/update_profile_data.dart';
import 'package:elwekala/features/profile/domain/repo/profile_repo.dart';
class ProfileRepoimpl extends ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepoimpl(this.profileRemoteDataSource);

  @override
  Future<Either<String, UserEntity>> getProfile({
    required String token,
  }) async {
    try {
      final model = await profileRemoteDataSource.getProfile(token: token);
      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  @override
  Future<Either<String, UpdateProfileDataEntity>> updateProfile({
    required String token,
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
  }) async {
    try {
      final model = await profileRemoteDataSource.updateProfile(
        token: token,
        name: name,
        email: email,
        phone: phone,
        gender: gender,
        password: password,
      );
      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
  
  @override
  Future<Either<String, String>> deleteProfile({required String token, required String email}) async {
    try {
      final model = await profileRemoteDataSource.deleteProfile(token: token, email: email);
      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
