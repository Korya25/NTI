void main() {
  Map studentinfo = {
    'mahmoud': {
      'age': 10,
      'major': 'computer Sience',
      'dgree': {'Network': 50, 'Ai': 50, 'English': 50},
    },
    'Mohamed': {
      'age': 10,
      'major': 'computer Sience',
      'dgree': {'Network': 50, 'Ai': 50, 'English': 50},
    },
    'mousa': {
      'age': 10,
      'major': 'computer Sience',
      'dgree': {'Network': 50, 'Ai': 50, 'English': 50},
    },
  };

  print(studentinfo['mahmoud']);
  print(studentinfo['mahmoud']['dgree']['Network']);
  print(studentinfo);
}
