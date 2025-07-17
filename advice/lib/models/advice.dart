class Advice {
  final int id;
  final String advice;

  Advice({required this.id, required this.advice});

  factory Advice.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('slip')) {
      final slip = json['slip'];
      return Advice(id: slip['id'] ?? 0, advice: slip['advice'] ?? '');
    } else {
      return Advice(id: json['id'] ?? 0, advice: json['advice'] ?? '');
    }
  }
}
