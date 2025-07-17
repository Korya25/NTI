import 'package:dartz/dartz.dart';
import 'package:elwekala/features/favorites/domain/entities/favorite_action_entite.dart';
import 'package:elwekala/features/favorites/domain/repos/favorite_repo.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';

class FavoriteUseCase {
  final FavoriteRepo repo;

  FavoriteUseCase(this.repo);

  Future<Either<String, List<Product>>> getAllFavorite({
    required String nationalId,
  }) {
    return repo.getAllFavorite(nationalId: nationalId);
  }

  Future<Either<String, FavoriteActionEntite>> addFavoriteAction({
    required String nationalId,
    required String productId,
  }) {
    return repo.addFavoriteAction(nationalId: nationalId, productId: productId);
  }
  Future<Either<String, FavoriteActionEntite>> deleteFavoriteAction({
    required String nationalId,
    required String productId,
  }) {
    return repo.deleteFavoriteAction(nationalId: nationalId, productId: productId);
  }
}
