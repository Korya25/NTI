import 'dart:io';

void main() {
  stdout.write('Enter Num: ');
  int? number = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= 12; i++) {
    print('$number × $i = ${number * i}');
  }
}
