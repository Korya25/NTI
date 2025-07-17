import 'package:elwekala/features/favorites/domain/useCase/favorite_use_case.dart';
import 'package:elwekala/features/favorites/presentation/controllers/favorite_state.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.useCase) : super(FavoriteIntialState());

  final FavoriteUseCase useCase;
  final List<Product> favoriteProducts = [];

  // Get All Favorites
  void getFavorite({required String nationalId}) async {
    final result = await useCase.getAllFavorite(nationalId: nationalId);
    result.fold(
      (errorMessage) => emit(FavoriteErrorState(error: errorMessage)),
      (products) {
        favoriteProducts.clear();
        favoriteProducts.addAll(products);
        emit(FavoriteGetSuccesState(favoriteProduct: products));
      },
    );
  }

  // Add Favorite
  void addFavorite({
    required String nationalId,
    required String productId,
  }) async {
    final result = await useCase.addFavoriteAction(
      nationalId: nationalId,
      productId: productId,
    );
    result.fold(
      (errorMessage) => emit(FavoriteErrorState(error: errorMessage)),
      (response) {
        emit(FavoriteActionState(favoriteActionEntite: response));
        getFavorite(nationalId: nationalId);
      },
    );
  }

  // Delete Favorite
  void deleteFavorite({
    required String nationalId,
    required String productId,
  }) async {
    final result = await useCase.deleteFavoriteAction(
      nationalId: nationalId,
      productId: productId,
    );
    result.fold(
      (errorMessage) => emit(FavoriteErrorState(error: errorMessage)),
      (response) {
        emit(FavoriteActionState(favoriteActionEntite: response));
        getFavorite(nationalId: nationalId);
      },
    );
  }
}
