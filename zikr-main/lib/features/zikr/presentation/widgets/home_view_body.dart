// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:counter_app/features/zikr/controller/zikr_cubit.dart';
import 'package:counter_app/features/zikr/presentation/widgets/counter_widget.dart';
import 'package:counter_app/features/zikr/presentation/widgets/background_selector.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.background,
    required this.count,
    required this.cubit,
  });

  final String background;
  final int count;
  final ZikrCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(background),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.1),
              Colors.black.withOpacity(0.4),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              CounterWidget(cubit: cubit, count: count),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: BackgroundSelector(cubit: cubit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}