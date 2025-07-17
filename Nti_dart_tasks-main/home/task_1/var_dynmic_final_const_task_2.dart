void main() {
  print('==========DIFFERENCE BETWEEN VAR AND DYNAMIC==========');

  // var properties variables
  String definitionVar =
      'Used to define a variable with the type automatically inferred based on the initial value';
  String varType = 'Static typing';
  String changeTypeVar = 'Cannot change the type of the variable as (int)';

  // dynamic properties variables
  String definitionDynamic =
      'Used to define a variable that can take any data type at any time';
  String dynamicType = 'Dynamic typing';
  String changeTypeDynamic =
      'Can change the type of the variable as (int, String, bool, ...)';

  // Display Difference
  print('Var\n');
  print(definitionVar);
  print(varType);
  print(changeTypeVar);

  print('\nDynamic\n');
  print(definitionDynamic);
  print(dynamicType);
  print(changeTypeDynamic);

  // Example in code
  var name = 'Mahmoud';
  name = 'Mohamed'; // Correct
  // name = 10; // Error

  dynamic num = 1;
  num = 20; // Correct
  num = 'Once'; // Correct

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
