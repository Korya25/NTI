void main() {
  opration(value: 10);
}

void opration({required num value}) {
  num addValue = value + 1;
  num subValue = value - 1;
  num reset = value = 0;

  print('After Add value $addValue');
  print('\n');
  print('After Add value $subValue');
  print('\n');

  print('After Add value $reset');
  print('\n');
}
