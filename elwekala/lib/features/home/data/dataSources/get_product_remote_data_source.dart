import 'package:dio/dio.dart';
import 'package:elwekala/core/api/api_consumer.dart';
import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/core/errors/exceptions.dart';
import 'package:elwekala/features/home/data/models/product_model.dart';

abstract class GetProductRemoteDataSource {
  Future<List<ProductModel>> getLaptops();
}

class GetProductRemoteDataSourceImpl extends GetProductRemoteDataSource {
  final ApiConsumer apiConsumer;

  GetProductRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<List<ProductModel>> getLaptops() async {
    try {
      // response
      final response = await apiConsumer.get(EndPoints.getLaptops);
      final List productList = response[ApiKeys.product];
      return productList.map((json) => ProductModel.fromJson(json)).toList();
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }
}
