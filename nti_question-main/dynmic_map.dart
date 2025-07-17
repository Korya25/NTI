void main() {
  List<Map> collection = [
    {0: 'Hello', 1: 'Welcome'},
    {1: 'Fail', 2: 'Good', 3: 'Very Good', 4: 'Excellent'},
    {0: 5, 1: 2, 2: 8, 3: 1, 4: 9},
  ];

  print('List Before any change: $collection');
  print('\n');

  collection.add({0: 'Item1', 1: 'Item2'});
  print('List After adding new value: $collection');
  print('\n');

  collection[0][0] = 'Hi';
  print('List After modifying element with index: $collection');
  print('\n');

  collection.add({0: 'Ai', 1: 'Arabic', 2: 'Network'});
  print('List After adding new Map to List: $collection');
  print('\n');

  List<int> numbersList = collection[2].values.cast<int>().toList();
  numbersList.sort();
  Map sortedNumbers = {};
  for (int i = 0; i < numbersList.length; i++) {
    sortedNumbers[i] = numbersList[i];
  }
  collection[2] = sortedNumbers;
  print('List After sorting numbers in sublist (index 2): $collection');
  print('\n');
}
