import 'package:api_task/core/errors/error_model.dart';
import 'package:api_task/core/errors/exceptions.dart';
import 'package:api_task/features/data/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'random_user_state.dart';

class RandomUserCubit extends Cubit<RandomUserState> {
  final UserRepo userRepo;

  RandomUserCubit(this.userRepo) : super(RandomUserInitial());

  Future<void> fetchRandomUsers({int count = 10}) async {
    emit(RandomUserLoading());
    try {
      final users = await userRepo.fetchUsers(count: count);
      emit(RandomUserSuccess(users));
    } on ServerException catch (e) {
      emit(RandomUserFailure(e.errorModel));
    } catch (e) {
      emit(RandomUserFailure(ErrorModel(
        message: 'Unexpected error occurred',
        statusCode: 0,
      )));
    }
  }
}
