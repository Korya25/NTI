import 'package:counter_app/counter_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/zikr/controller/zikr_cubit.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ZikrCubit(),
      child: const MyApp(),
    ),
  );
}