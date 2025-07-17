// repositories/api_repository.dart
import 'dart:convert';
import 'package:advice/models/advice.dart';
import 'package:advice/models/cat_fact.dart';
import 'package:advice/models/qoute.dart';
import 'package:dio/dio.dart';

class ApiRepository {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
    ),
  );

 Future<Advice> getAdvice() async {
  try {
    final response = await _dio.get('https://api.adviceslip.com/advice');
    
    // Handle the response data
    dynamic data = response.data;
    if (data is String) {
      data = jsonDecode(data);
    }
    
    return Advice.fromJson(data);
  } catch (e) {
    throw Exception('Failed to get advice');
  }
}
  Future<Quote> getQuote() async {
    try {
      final response = await _dio.get('https://api.quotable.io/random');
      return Quote.fromJson(response.data);
    } catch (e) {
      // Return default quote if API fails
      return Quote(
        content: "The only way to do great work is to love what you do.",
        author: "Steve Jobs",
      );
    }
  }

  Future<CatFact> getCatFact() async {
    try {
      final response = await _dio.get('https://catfact.ninja/fact');
      return CatFact.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch cat fact');
    }
  }
}