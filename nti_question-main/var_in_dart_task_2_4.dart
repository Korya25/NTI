void main() {
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
  // Example in code
  var name = 'Mahmoud';
  name = 'Mohamed'; // Correct
  // name = 10; // Error

  dynamic num = 1;
  num = 20; // Correct
  num = 'Once'; // Correct
}
