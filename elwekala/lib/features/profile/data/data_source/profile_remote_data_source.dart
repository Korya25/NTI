import 'package:dio/dio.dart';
import 'package:elwekala/core/api/api_consumer.dart';
import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/core/cache/cache_helper.dart';
import 'package:elwekala/core/cache/cache_keys.dart';
import 'package:elwekala/core/data/models/user_model.dart';
import 'package:elwekala/core/errors/error_model.dart';
import 'package:elwekala/core/errors/exceptions.dart';
import 'package:elwekala/features/profile/data/model/update_profile_data_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> getProfile({required String token});

  Future<UpdateProfileDataModel> updateProfile({
    required String token,
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
  });

  Future<String> deleteProfile({required String token, required String email});
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiConsumer apiConsumer;

  ProfileRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<UserModel> getProfile({required String token}) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.getProfile,
        data: {ApiKeys.token: token},
      );
      return UserModel.fromJson(response[ApiKeys.user]);
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<UpdateProfileDataModel> updateProfile({
    required String token,
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
  }) async {
    try {
      final response = await apiConsumer.put(
        EndPoints.updateProfile,
        data: {
          'token': token,
          'name': name,
          'email': email,
          'phone': phone,
          'gender': gender,
          'password': password,
        },
      );

      final status = response['status'];
      final message = response['message'];
      final userData = response['user'];
      final newToken = response['token'];

      if (status == 'failure' || userData == null) {
        throw ServerException(errorModel: message ?? 'حدث خطأ أثناء التحديث');
      }

      if (newToken != null && newToken is String) {
        await CacheHelper().saveData(key: CacheKeys.token, value: newToken);
      }

      return UpdateProfileDataModel.fromJson(userData);
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<String> deleteProfile({
    required String token,
    required String email,
  }) async {
    try {
      final response = await apiConsumer.delete(
        EndPoints.deleteProfile,
        data: {'token': token, 'email': email},
      );
      return response['message'];
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    } catch (e) {
      throw ServerException(
        errorModel: ErrorModel(
          status: 'error',
          message: e.toString().replaceAll('Exception: ', ''),
        ),
      );
    }
  }
}
