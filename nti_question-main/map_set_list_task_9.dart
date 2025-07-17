void main() {
  // List
  List<String> fruits = ['Apple', 'Banana', 'Orange', 'Apple'];
  fruits.add('Mango');
  print('List of fruits: $fruits');
  print('List length: ${fruits.length}');

  // MAp
  Map<String, int> ages = {'Ahmed': 25, 'Sarah': 30, 'Mohamed': 28};
  ages['Ali'] = 22;
  print('Ages: $ages');
  print('Map length: ${ages.length}');

  // Set
  Set<String> colors = {'Red', 'Blue', 'Green'};
  colors.add('Yellow');
  colors.add('Red');
  print('Set of colors: $colors');
  print('Set length: ${colors.length}');
}
