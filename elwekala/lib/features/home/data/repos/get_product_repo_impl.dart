import 'package:dartz/dartz.dart';
import 'package:elwekala/core/errors/exceptions.dart';
import 'package:elwekala/features/home/data/dataSources/get_product_remote_data_source.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';
import 'package:elwekala/features/home/domain/repos/get_product_repository.dart';

class GetProductRepoImpl extends GetProductRepository {
  final GetProductRemoteDataSource remoteDataSource;

  GetProductRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<String, List<Product>>> getLaptops() async {
    try {
      final model = await remoteDataSource.getLaptops();

      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
