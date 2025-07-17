import 'package:dartz/dartz.dart';
import 'package:elwekala/features/home/domain/entities/product.dart';
import 'package:elwekala/features/home/domain/repos/get_product_repository.dart';

class GetProductUseCase {
  final GetProductRepository repository;

  GetProductUseCase( this.repository);

  // get laptop product
  Future<Either<String, List<Product>>> getLaptops() {
    return repository.getLaptops();
  }
}
