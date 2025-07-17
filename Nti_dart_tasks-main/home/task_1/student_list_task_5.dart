void main() {
  // add studen name list
  final List<String> studentName = ['Mahmoud', 'Mousa'];

  //  add 3 new name to list
  print(studentName);
  studentName.insertAll(0, ['Mo Salah', 'John', 'Messi']);
  print('After add 3 new name to list: $studentName');

  // remove name  in center
  int midNameIndex = midElemnt(studentName);
  studentName.removeAt(midNameIndex);
  print('After remove center name into list: ${studentName}');

  // display length
  print('List Length is : ${studentName.length}');

  // using contains
  print('Find Mousa nam ${studentName.contains('Mousa')}');
}

int midElemnt(List<String> studentName) {
  int midIndex = studentName.length ~/ 2;

  return midIndex;
}
