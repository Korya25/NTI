import 'package:elwekala/features/profile/domain/use_case/profile_use_case.dart';
import 'package:elwekala/features/profile/presentation/controller/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.useCase) : super(ProfileIntialState());

  final ProfileUseCase useCase;

  void getProfile({required String token}) async {
    emit(ProfileGetLoadinglState());
    final result = await useCase.getProfile(token: token);
    result.fold(
      (errorMessage) => emit(ProfileGetErrorState(errorMessage)),
      (user) => emit(ProfileGetSucessState(user)),
    );
  }

  void updateProfile({
    required String token,
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
  }) async {
    emit(ProfileUpdateLoadingState());

    final result = await useCase.updateProfile(
      token: token,
      name: name,
      email: email,
      phone: phone,
      gender: gender,
      password: password,
    );

    result.fold((errorMessage) => emit(ProfileUpdateErrorState(errorMessage)), (
      updatedUser,
    ) async {
      emit(ProfileUpdateSuccessState(updatedUser));

      final profileResult = await useCase.getProfile(token: token);
      profileResult.fold(
        (errorMessage) => emit(ProfileGetErrorState(errorMessage)),
        (user) => emit(ProfileGetSucessState(user)),
      );
    });
  }

  void deleteProfile({required String token, required String email}) async {
    emit(ProfileDeleteLoadingState());
    final result = await useCase.deleteProfile(token: token, email: email);
    result.fold(
      (errorMessage) => emit(ProfileDeleteErrorState(errorMessage)),
      (message) => emit(ProfileDeleteSuccessState(message)),
    );
  }
}
