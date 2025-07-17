void main() {
  Map employee = {'Ali': 3000, 'Sara': 4000, 'Ahmed': 3500, 'Laila': 4500};

  //  Add new Employee
  print('Before any change: $employee');
  print('\n');
  employee['Khaled'] = 500;
  print('After Add New employer: $employee');
  print('\n');

  //  Check Find Ali
  print('If Ali Is Found ${employee.containsKey('Ali')}');
  print('\n');

  // delate AHemwd
  print('After Delate Ahmed ${employee.remove('Ahmed')}');
  print('\n');

  print('Keys: ${employee.keys}');
  print('\n');

  print('Keys: ${employee.values}');
  print('\n');

  for (var key in employee.keys.toList()) {
    employee[key] = employee[key]! * 1.10;
  }
  print('After Update Salary: $employee');
}
