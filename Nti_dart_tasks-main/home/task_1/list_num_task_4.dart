void main() {
  // add 5 num
  final List<num> numbers = [1, 2, 3, 4, 5];

  // remove index 0
  print(numbers);
  numbers.removeAt(0);
  print('After Remove Frist Elemnt $numbers');

  // remove index = numbers length -1
  numbers.removeAt(numbers.length - 1);
  print('After Remove last Elemnt $numbers');

  // display
  print('After all changes $numbers');
}
