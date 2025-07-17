import 'dart:ui';

class ZikrState {
  final int count;
  final String currentZikr;
  final String background;

  ZikrState({
    required this.count,
    required this.currentZikr,
    required this.background,
  });

  ZikrState copyWith({
    int? count,
    String? currentZikr,
    String? background,
    Color? textColor,
  }) {
    return ZikrState(
      count: count ?? this.count,
      currentZikr: currentZikr ?? this.currentZikr,
      background: background ?? this.background,
    );
  }
}
