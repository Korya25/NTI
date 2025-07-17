import 'package:elwekala/features/auth/domain/usecases/auth_use_case.dart';
import 'package:elwekala/features/auth/presentation/controllers/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase authUseCase;

  AuthCubit(this.authUseCase) : super(AuthInitial());
void login({required String email, required String password}) async {
  emit(AuthLoading());

  final result = await authUseCase.login(email: email, password: password);

  result.fold(
    (errorMessage) => emit(AuthFailure(message: errorMessage)),
    (user) async {
      await authUseCase.saveToken(user.token);
      emit(AuthSuccess(user: user));
    },
  );
}


  void register({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
    required String profileImage,
  }) async {
    emit(AuthLoading());

    final result = await authUseCase.register(
      name: name,
      email: email,
      phone: phone,
      nationalId: nationalId,
      gender: gender,
      password: password,
      profileImage: profileImage,
    );

    result.fold(
      (errorMessage) => emit(AuthFailure(message: errorMessage)),
      (user) async {
      await authUseCase.saveToken(user.token); 
      emit(AuthSuccess(user: user));
    },
    );
  }
}
