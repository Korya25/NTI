import 'package:advice/models/advice.dart';
import 'package:advice/models/cat_fact.dart';
import 'package:advice/models/qoute.dart';

class AppState {
  final bool isLoading;
  final String? error;
  final Advice? advice;
  final Quote? quote;
  final CatFact? catFact;

  const AppState({
    this.isLoading = false,
    this.error,
    this.advice,
    this.quote,
    this.catFact,
  });

  AppState copyWith({
    bool? isLoading,
    String? error,
    Advice? advice,
    Quote? quote,
    CatFact? catFact,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      advice: advice ?? this.advice,
      quote: quote ?? this.quote,
      catFact: catFact ?? this.catFact,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppState &&
        other.isLoading == isLoading &&
        other.error == error &&
        other.advice == advice &&
        other.quote == quote &&
        other.catFact == catFact;
  }


}