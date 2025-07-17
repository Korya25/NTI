import 'package:elwekala/core/cache/cache_helper.dart';
import 'package:elwekala/core/observer/app_bloc_observer.dart';
import 'package:elwekala/injection.dart';
import 'package:elwekala/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await CacheHelper().init();

  await init();
  runApp(const MyApp());
}