// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/core/constants/app_text_styles.dart';
import 'package:counter_app/features/zikr/controller/zikr_cubit.dart';
import 'package:counter_app/features/zikr/controller/zikr_state.dart';
import 'package:counter_app/features/zikr/presentation/widgets/home_view_body.dart';
import 'package:counter_app/features/zikr/presentation/widgets/custom_zikr_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZikrCubit, ZikrState>(
      builder: (context, state) {
        final cubit = context.read<ZikrCubit>();
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Text(
                state.currentZikr,
                style: AppTextStyles.lobsterTwo28BoldWhite.copyWith(
                  shadows: [
                    Shadow(
                      offset: const Offset(1, 1),
                      blurRadius: 3,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white, size: 28),
          ),
          drawer: CustomZikrDrawer(cubit: cubit),
          body: HomeViewBody(
            background: state.background,
            count: state.count,
            cubit: cubit,
          ),
        );
      },
    );
  }
}
