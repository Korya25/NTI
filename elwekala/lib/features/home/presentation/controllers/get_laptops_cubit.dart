import 'package:elwekala/features/home/domain/entities/product.dart';
import 'package:elwekala/features/home/domain/usecase/get_product_use_case.dart';
import 'package:elwekala/features/home/presentation/controllers/get_laptops_state.dart';
import 'package:elwekala/features/home/presentation/widgets/filter_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetLaptopsCubit extends Cubit<GetLaptopsState> {
  GetLaptopsCubit(this.useCase) : super(GetLaptopsIntial());

  final GetProductUseCase useCase;
  List<Product> allProducts = [];

  void getLaptops() async {
    emit(GetLaptopsLoading());

    final resualt = await useCase.getLaptops();
    resualt.fold(
      (errorMessage) => emit(GetLaptopsFailure(errorMessage: errorMessage)),
      (products) {
        allProducts = products;
        emit(GetLaptopsSuccess(products: products));
      },
    );
  }

  void filterLaptops(ProductFilterOptions filterOptions) {
    emit(GetLaptopsLoading());

    final filteredProducts = allProducts.where((product) {
      final matchesStatus =
          filterOptions.status == null ||
          product.status == filterOptions.status;
     
      final matchesName =
          filterOptions.name == null ||
          product.name.toLowerCase().contains(
            filterOptions.name!.toLowerCase(),
          );
      final matchesMinPrice =
          filterOptions.minPrice == null ||
          product.price >= filterOptions.minPrice!;
      final matchesMaxPrice =
          filterOptions.maxPrice == null ||
          product.price <= filterOptions.maxPrice!;
     

      return matchesStatus &&
          matchesName &&
          matchesMinPrice &&
          matchesMaxPrice 
          ;
    }).toList();

    emit(GetLaptopsSuccess(products: filteredProducts));
  }
}
