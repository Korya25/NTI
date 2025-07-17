import 'package:flutter/material.dart';

class CounterState {
  final String text;
  final Color color;
  final int count;

  const CounterState({
    required this.text,
    required this.color,
    required this.count,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CounterState &&
        other.text == text &&
        other.color == color &&
        other.count == count;
  }

  @override
  int get hashCode => text.hashCode ^ color.hashCode ^ count.hashCode;

  @override
  String toString() {
    return 'CounterState(text: $text, color: $color, count: $count)';
  }
}
