import 'package:advice/cubit/app_state.dart';
import 'package:advice/repo/api_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  final ApiRepository _repository;

  AppCubit(this._repository) : super(const AppState());

  Future<void> getAdvice() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final advice = await _repository.getAdvice();
      emit(state.copyWith(
        isLoading: false,
        advice: advice,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> getQuote() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final quote = await _repository.getQuote();
      emit(state.copyWith(
        isLoading: false,
        quote: quote,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> getCatFact() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final catFact = await _repository.getCatFact();
      emit(state.copyWith(
        isLoading: false,
        catFact: catFact,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }
}
