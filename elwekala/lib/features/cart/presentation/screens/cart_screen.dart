import 'package:elwekala/core/constants/app_colors.dart';
import 'package:elwekala/core/constants/app_routes.dart';
import 'package:elwekala/core/widgets/custom_button.dart';
import 'package:elwekala/features/cart/domain/entities/get_cart_product_entity.dart';
import 'package:elwekala/features/cart/presentation/controllers/cart_cubit.dart';
import 'package:elwekala/features/cart/presentation/controllers/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCart(nationalId: "01026524572123");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Cart')),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartFailure) {
            return Center(child: Text(state.error));
          } else if (state is CartGetSuccess) {
            final cartItems = state.products;
            final total = cartItems.fold(
              0.0,
              (sum, item) => sum + (item.price * item.quantity),
            );

            if (cartItems.isEmpty) {
              return _buildEmptyCartUI(context);
            }

            return _buildCartList(cartItems, total);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildEmptyCartUI(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 60.sp, color: AppColors.iconColor),
          SizedBox(height: 16.h),
          Text('Your cart is empty', style: TextStyle(fontSize: 18.sp, color: AppColors.secondaryTextColor)),
          SizedBox(height: 8.h),
          Text('Add some products to your cart', style: TextStyle(fontSize: 14.sp, color: AppColors.secondaryTextColor)),
          SizedBox(height: 16.h),
          CustomButton(
            text: 'Browse Products',
            onPressed: () => context.go(AppRoutes.home),
            width: 200.w,
          ),
        ],
      ),
    );
  }

  Widget _buildCartList(List<GetCartProductEntity> cartItems, double total) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return Card(
                margin: EdgeInsets.only(bottom: 16.h),
                child: ListTile(
                  leading: Image.network(
                    item.image,
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 60.w,
                        height: 60.h,
                        color: AppColors.secondaryColor,
                        child: const Icon(Icons.image_not_supported),
                      );
                    },
                  ),
                  title: Text(item.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\$${item.price.toStringAsFixed(2)}'),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              final newQuantity = item.quantity - 1;
                              if (newQuantity > 0) {
                                context.read<CartCubit>().updateCart(
                                      nationalId: '01026524572123',
                                      productId: item.id,
                                      quantity: newQuantity.toString(),
                                    );
                              }
                            },
                          ),
                          Text('${item.quantity}'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              context.read<CartCubit>().updateCart(
                                    nationalId: '01026524572123',
                                    productId: item.id,
                                    quantity: (item.quantity + 1).toString(),
                                  );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {
                      context.read<CartCubit>().deleteCart(
                            nationalId: "01009876567876",
                            productId: item.id,
                          );
                    },
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.surfaceColor,
            border: Border(top: BorderSide(color: AppColors.borderColor)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total:', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  Text(
                    '\$${total.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              CustomButton(
                text: 'Checkout',
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
