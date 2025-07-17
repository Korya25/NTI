import 'package:counter_app/core/constants/app_assets.dart';
import 'package:counter_app/core/constants/app_strings.dart';
import 'package:counter_app/features/zikr/controller/zikr_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZikrCubit extends Cubit<ZikrState> {
  ZikrCubit()
      : super(ZikrState(
          count: 0,
          currentZikr: AppStrings.mainZikr,
          background: AppAssets.image1,
        ));

  void increment() => emit(state.copyWith(count: state.count + 1));
void decrement() {
  if (state.count > 0) {
    emit(state.copyWith(count: state.count - 1));
  }
}


  void reset() => emit(state.copyWith(count: 0));
  void changeZikr(String newZikr) => emit(state.copyWith(currentZikr: newZikr));
  void changeBackground(String imagePath) => emit(state.copyWith(background: imagePath));
}