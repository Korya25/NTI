import 'package:dartz/dartz.dart';
import 'package:elwekala/core/errors/exceptions.dart';
import 'package:elwekala/features/favorites/data/dataSources/favorit_remote_data_source.dart';
import 'package:elwekala/features/favorites/domain/entities/favorite_action_entite.dart';
import 'package:elwekala/features/favorites/domain/repos/favorite_repo.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';

class GetFavoriteRepoImpl extends FavoriteRepo {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  GetFavoriteRepoImpl({required this.favoriteRemoteDataSource});
  @override
  Future<Either<String, List<Product>>> getAllFavorite({
    required String nationalId,
  }) async {
    try {
      final model = await favoriteRemoteDataSource.getFavorite(
        nationalId: nationalId,
      );
      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  @override
  Future<Either<String, FavoriteActionEntite>> addFavoriteAction({
    required String nationalId,
    required String productId,
  }) async {
    try {
      final model = await favoriteRemoteDataSource.addFavoriteAction(
        nationalId: nationalId,
        productId: productId,
      );
      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  @override
  Future<Either<String, FavoriteActionEntite>> deleteFavoriteAction({
    required String nationalId,
    required String productId,
  }) async {
    try {
      final model = await favoriteRemoteDataSource.deleteFavoriteAction(
        nationalId: nationalId,
        productId: productId,
      );
      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
