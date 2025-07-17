void main() {
  final List<String> fruit = ["Apple", "Banana", "Orange"];

  // add elemnt
  print('Add Element\n');
  fruit.insert(0, ' Plums');
  print('$fruit');
  print('\n=====================================\n');

  // remove element
  print('Remove Element\n');

  fruit.remove('Apple');
  print('$fruit');
  print('\n=====================================\n');

  // edit element
  print('Edit Element\n');

  fruit[2] = 'Strawberry';
  print('$fruit');
  print('\n=====================================\n');

  // display list
  print('Aftter all changs \n');

  print('$fruit');
}
