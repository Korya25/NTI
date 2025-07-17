import 'package:dio/dio.dart';
import 'package:elwekala/core/api/api_consumer.dart';
import 'package:elwekala/core/api/api_interpreter.dart';
import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/core/errors/error_model.dart';
import 'package:elwekala/core/errors/exceptions.dart';
import 'package:elwekala/features/auth/data/models/auth_model.dart';


abstract class AuthRemoteDataSource {
  Future<AuthModel> login({required String email, required String password});
  Future<AuthModel> register({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
    required String profileImage,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      // response
      final response = await apiConsumer.post(
        EndPoints.login,
        data: {ApiKeys.email: email, ApiKeys.password: password},
      );

      // check response
      ApiInterpreter.checkResponseStatus(response);

      // return data
      return AuthModel.fromJson(response);
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

  @override
  Future<AuthModel> register({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
    required String profileImage,
  }) async {
    try {
      // response
      final response = await apiConsumer.post(
        EndPoints.register,
        data: {
          ApiKeys.name: name,
          ApiKeys.email: email,
          ApiKeys.phone: phone,
          ApiKeys.nationalId: nationalId,
          ApiKeys.gender: gender,
          ApiKeys.password: password,
          ApiKeys.profileImage: profileImage,
        },
      );

      // check response
      ApiInterpreter.checkResponseStatus(response);

      // return data
      return AuthModel.fromJson(response);
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
