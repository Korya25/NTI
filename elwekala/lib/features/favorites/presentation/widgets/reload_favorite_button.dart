import 'package:elwekala/features/favorites/presentation/controllers/favorite_cubit.dart';
import 'package:elwekala/features/favorites/presentation/controllers/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReloadFavoriteButton extends StatelessWidget {
  const ReloadFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final isLoading = state is FavoriteLoadingState;

        return IconButton(
          onPressed: isLoading
              ? null
              : () {
                  context.read<FavoriteCubit>().getFavorite(
                    nationalId: "01009876567876",
                  );
                },
          icon: isLoading
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.refresh),
        );
      },
    );
  }
}
