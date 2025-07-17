import 'dart:io';

void main() {
  // product name
  stdout.write('Enter product name: ');
  String productName = stdin.readLineSync()!;

  // product price
  stdout.write('Enter product price: ');
  double productPrice = double.parse(stdin.readLineSync()!);

  // product quantity available
  stdout.write('Enter product quantity available: ');
  int producTQuantity = int.parse(stdin.readLineSync()!);

  // is available in stock
  stdout.write('Is product available in stock? (true/false): ');
  bool isAvailableInStock = bool.parse(stdin.readLineSync()!);

  // product manufacture
  stdout.write('Enter product manufacture: ');
  String productManufacture = stdin.readLineSync()!;

  // Display product details
  print('==============================================');
  print('Product name: ${productName.toUpperCase()}');
  print('Product price: \$$productPrice');
  print('Product quantity available: $producTQuantity');
  print('Is product available in stock: $isAvailableInStock');
  print('Product manufacture: $productManufacture');
  print('==============================================');
}
