import 'package:dartz/dartz.dart';
import 'package:elwekala/features/favorites/domain/entities/favorite_action_entite.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';

abstract class FavoriteRepo {
  Future<Either<String, List<Product>>> getAllFavorite({
    required String nationalId,
  });
  Future<Either<String, FavoriteActionEntite>> addFavoriteAction({
    required String nationalId,
    required String productId,
  });
  Future<Either<String, FavoriteActionEntite>> deleteFavoriteAction({
    required String nationalId,
    required String productId,
  });
}
