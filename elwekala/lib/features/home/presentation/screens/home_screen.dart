import 'package:elwekala/core/utils/app_dialogs.dart';
import 'package:elwekala/features/home/presentation/controllers/get_laptops_cubit.dart';
import 'package:elwekala/features/home/presentation/controllers/get_laptops_state.dart';
import 'package:elwekala/features/home/presentation/widgets/home_app_bar.dart';
import 'package:elwekala/features/home/presentation/widgets/laptop_failure_body.dart';
import 'package:elwekala/features/home/presentation/widgets/laptop_loading_body.dart';
import 'package:elwekala/features/home/presentation/widgets/laptop_success_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(16.w), child: _HomeScreenBody()),
      ),
    );
  }
}

class _HomeScreenBody extends StatefulWidget {
  const _HomeScreenBody();

  @override
  State<_HomeScreenBody> createState() => __HomeScreenBodyState();
}

class __HomeScreenBodyState extends State<_HomeScreenBody> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetLaptopsCubit, GetLaptopsState>(
      listener: (context, state) {
        if (state is GetLaptopsFailure) {
          AppDialogs.showError(context, state.errorMessage);
        }
      },
      builder: (BuildContext context, GetLaptopsState state) {
        if (state is GetLaptopsLoading) {
          return const LaptopLoadingBody();
        } else if (state is GetLaptopsSuccess) {
          return LaptopSuccessBody(
            products: state.products,
            searchController: _searchController,
          );
        } else if (state is GetLaptopsFailure) {
          return LaptopFailureBody(errorMessage: state.errorMessage);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
