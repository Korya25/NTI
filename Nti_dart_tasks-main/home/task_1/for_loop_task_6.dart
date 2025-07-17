void main() {
  // create a List contain NUmbers
  final List<num> numbers = [1, 2, 3];

  // Using for loop to display all numbers
  print(numbers);
  print('Display all num Using For loop');
  for (var i = 0; i < numbers.length; i++) {
    print(numbers[i]);
  }

  // using for each to display nums with the current value
  print('Display all num Using For each');
  numbers.forEach((num) {
    print('The current value : $num');
  });
}
