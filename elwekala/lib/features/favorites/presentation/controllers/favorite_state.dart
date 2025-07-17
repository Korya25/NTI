import 'package:elwekala/features/favorites/domain/entities/favorite_action_entite.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';

abstract class FavoriteState {}

class FavoriteIntialState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteGetSuccesState extends FavoriteState {
  final List<Product> favoriteProduct;

  FavoriteGetSuccesState({required this.favoriteProduct});
}

class FavoriteActionState extends FavoriteState {
  final FavoriteActionEntite favoriteActionEntite;

  FavoriteActionState({required this.favoriteActionEntite});
}

class FavoriteErrorState extends FavoriteState {
  final String error;

  FavoriteErrorState({required this.error});
}
