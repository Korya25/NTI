import 'package:elwekala/features/favorites/presentation/controllers/favorite_cubit.dart';
import 'package:elwekala/features/favorites/presentation/controllers/favorite_state.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButton extends StatelessWidget {
  final Product product;
  final String? nationalId;
  final double? size;

  const FavoriteButton({super.key, required this.product, this.nationalId, this.size});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoriteCubit>();
    cubit.favoriteProducts.any((p) => p.id == product.id);

    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final cubit = context.read<FavoriteCubit>();
        final isFavorite = cubit.favoriteProducts.any(
          (p) => p.id == product.id,
        );

        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.pink : Colors.grey,
            size: size ?? 24,
          ),
          onPressed: () {
            if (isFavorite) {
              cubit.deleteFavorite(
                nationalId: nationalId ?? '01009876567876',
                productId: product.id,
              );
            } else {
              cubit.addFavorite(
                nationalId: nationalId ?? '01009876567876',
                productId: product.id,
              );
            }
          },
        );
      },
    );
  }
}
