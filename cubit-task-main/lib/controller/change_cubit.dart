import 'dart:math';
import 'package:cubit_task/controller/change_state.dart';
import 'package:cubit_task/data/test_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(
          CounterState(
            text: namesList().first,
            color: colorsList().first,
            count: numList().first,
          ),
        );

  void changeValues() {
    final random = Random();
    
    String newText;
    Color newColor;
    int newCount;
    
    do {
      newText = namesList()[random.nextInt(namesList().length)];
    } while (newText == state.text);
    
    do {
      newColor = colorsList()[random.nextInt(colorsList().length)];
    } while (newColor == state.color);
    
    do {
      newCount = numList()[random.nextInt(numList().length)];
    } while (newCount == state.count);

    emit(
      CounterState(
        text: newText,
        color: newColor,
        count: newCount,
      ),
    );
  }
}

