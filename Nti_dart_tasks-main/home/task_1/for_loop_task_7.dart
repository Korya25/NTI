void main() {
  // create loop to display 1 : 20
  print('=============Numbers=============');

  for (var i = 1; i <= 20; i++) {
    print(i);
  }

  // create loop to dislay a products
  print('=============Product=============');
  final List<String> product = ['Laptop', 'Phone', 'airpods'];
  for (var i = 0; i < product.length; i++) {
    print(product[i]);
  }
}
