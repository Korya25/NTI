
import 'package:elwekala/core/utils/app_dialogs.dart';
import 'package:elwekala/features/favorites/presentation/controllers/favorite_cubit.dart';
import 'package:elwekala/features/favorites/presentation/controllers/favorite_state.dart';
import 'package:elwekala/features/favorites/presentation/widgets/empty_favorite.dart';
import 'package:elwekala/features/favorites/presentation/widgets/reload_favorite_button.dart';
import 'package:elwekala/features/home/presentation/widgets/sliver_grid_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: AppBar(
          title: const Text('My Favorites'),
          actions: const [ReloadFavoriteButton()],
        ),
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.all(12),
          child: const FavoritesScreenBody(),
        )),
      
    );
  }
}

class FavoritesScreenBody extends StatelessWidget {
  const FavoritesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state is FavoriteErrorState) {
          AppDialogs.showError(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is FavoriteLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is FavoriteGetSuccesState) {
          if (state.favoriteProduct.isEmpty) {
            return const EmptyFavoriteList();
          }

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [SliverGridProducts(products: state.favoriteProduct)],
          );
        }

        return const SizedBox();
      },
    );
  }
}
