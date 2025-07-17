void main() {
  print('==========DIFFERENCE BETWEEN FINAL AND CONST==========');

  // final properties variables
  String assignValueFinal =
      'Used to define a variable that can only be assigned once';

  String updateValueFinal = 'Value can update';

  // const properties variables

  String assignValueConst = 'It must take a value when it is defined ';
  String updateValueConst = 'value cannot be updated';

  // Display Difference
  print('Final\n');
  print(assignValueFinal);
  print(updateValueFinal);

  print('\nConst\n');
  print(assignValueConst);
  print(updateValueConst);

  // Example in code
  final String color = 'red'; // Correct
  // color = ''; // Error
  final int gpa; // Correct

  // const String anmial; // Error
  const String book = 'dfgb'; // Corrcet
  // book = 'vfdbgfn'; // Error
}
