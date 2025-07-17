import 'package:advice/cubit/app_cubit.dart';
import 'package:advice/repo/api_repo.dart';
import 'package:advice/views/home_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData.dark().copyWith(
            primaryColor: Colors.purple,
            scaffoldBackgroundColor: const Color(0xFF121212),
            cardColor: const Color(0xFF1E1E1E),
            colorScheme: const ColorScheme.dark().copyWith(
              primary: Colors.purple,
              secondary: Colors.purpleAccent,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1E1E1E),
              elevation: 0,
            ),
          ),
          home: BlocProvider(
            create: (context) => AppCubit(ApiRepository()),
            child: const MainScreen(),
          ),
        );
      },
    );
  }
}
