import 'package:elwekala/features/cart/domain/useCase/cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartUseCase cartUseCase;

  CartCubit(this.cartUseCase) : super(CartInitial());

  Future<void> getCart({required String nationalId}) async {
    emit(CartLoading());
    final result = await cartUseCase.getCart(nationalId: nationalId);
    result.fold(
      (failure) => emit(CartFailure(failure)),
      (products) => emit(CartGetSuccess(products)),
    );
  }

  Future<void> addCart({
    required String nationalId,
    required String productId,
    required String quantity,
  }) async {
    emit(CartLoading());
    final result = await cartUseCase.addCart(
      nationalId: nationalId,
      productId: productId,
      quantity: quantity,
    );
    result.fold(
      (failure) => emit(CartFailure(failure)),
      (user) => emit(CartAddSuccess(user)),
    );
  }

  Future<void> deleteCart({
    required String nationalId,
    required String productId,
  }) async {
    emit(CartLoading());
    final result = await cartUseCase.deleteCart(
      nationalId: nationalId,
      productId: productId,
    );
    result.fold(
      (failure) => emit(CartFailure(failure)),
      (updatedItems) => emit(CartDeleteSuccess(updatedItems)),
    );
  }

  Future<void> updateCart({
    required String nationalId,
    required String productId,
    required String quantity,
  }) async {
    emit(CartLoading());
    final result = await cartUseCase.updateCart(
      nationalId: nationalId,
      productId: productId,
      quantity: quantity,
    );
    result.fold(
      (failure) => emit(CartFailure(failure)),
      (updatedProduct) => emit(CartUpdateSuccess(updatedProduct)),
    );
  }
}
