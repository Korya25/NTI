import 'package:device_preview/device_preview.dart';
import 'package:elwekala/core/resources/app_router.dart';
import 'package:elwekala/core/resources/app_theme.dart';
import 'package:elwekala/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:elwekala/features/cart/presentation/controllers/cart_cubit.dart';
import 'package:elwekala/features/favorites/presentation/controllers/favorite_cubit.dart';
import 'package:elwekala/features/home/presentation/controllers/get_laptops_cubit.dart';
import 'package:elwekala/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthCubit>()),
        BlocProvider(create: (_) => sl<GetLaptopsCubit>()..getLaptops()),
        BlocProvider(
          create: (_) =>
              sl<FavoriteCubit>()..getFavorite(nationalId: "01009876567876"),
        ),
        BlocProvider(
          create: (context) =>
              sl<CartCubit>()..getCart(nationalId: "01026524572123"),
        ),
      ],

      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(

            title: 'Auth App',
            theme: AppTheme.lightTheme,
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
