void main() {
  final Map favoriteSport = {
    'club': {
      'Zamalek': {
        'slogen': 'MOST ITLED IN THE 20TH CENTURY',
        'PlayerNumber': 23,
        'Champion': 117,
        'PlayWorldCup': false,
      },
    },
  };
  print('Slogen:${favoriteSport['club']['Zamalek']['slogen']}');
  print('Player Number : ${favoriteSport['club']['Zamalek']['PlayerNumber']}');
  print('Champion Count ${favoriteSport['club']['Zamalek']['Champion']}');
  print('Play in World Cup${favoriteSport['club']['Zamalek']['PlayWorldCup']}');
}
