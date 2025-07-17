import 'package:api_task/core/errors/error_model.dart';
import 'package:api_task/features/data/model/user_model.dart';

abstract class RandomUserState {}

class RandomUserInitial extends RandomUserState {}

class RandomUserLoading extends RandomUserState {}

class RandomUserSuccess extends RandomUserState {
  final List<UserModel> users;

  RandomUserSuccess(this.users);
}

class RandomUserFailure extends RandomUserState {
  final ErrorModel error;

  RandomUserFailure(this.error);
}
