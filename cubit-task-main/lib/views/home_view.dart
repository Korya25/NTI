import 'package:cubit_task/controller/change_cubit.dart';
import 'package:cubit_task/controller/change_state.dart';
import 'package:cubit_task/widgets/change_button.dart';
import 'package:cubit_task/widgets/color_card.dart';
import 'package:cubit_task/widgets/count_card.dart';
import 'package:cubit_task/widgets/home_app_bar.dart';
import 'package:cubit_task/widgets/name_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF667eea), Color(0xFF764ba2), Color(0xFF6B73FF)],
          ),
        ),
        child: SafeArea(
          child: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Column(
                children: [
                  HomeAppBar(state: state),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NameCard(state: state),
                          const SizedBox(height: 20),
                          ColorCard(state: state),
                          const SizedBox(height: 20),
                          CountCard(state: state),
                          const SizedBox(height: 40),
                          ChangeButton(state: state),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}