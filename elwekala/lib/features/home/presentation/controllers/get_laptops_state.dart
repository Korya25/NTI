import 'package:elwekala/features/home/domain/entities/product.dart';

abstract class GetLaptopsState {}

class GetLaptopsIntial extends GetLaptopsState {}

class GetLaptopsLoading extends GetLaptopsState {}

class GetLaptopsSuccess extends GetLaptopsState {
  final List<Product> products;

  GetLaptopsSuccess({required this.products});
}

class GetLaptopsFailure extends GetLaptopsState {
  final String errorMessage;

  GetLaptopsFailure({required this.errorMessage});
}
