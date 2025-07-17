import 'package:bookna_app/features/books/presentation/widget/top_rated_books_content.dart';
import 'package:flutter/material.dart';
import 'package:bookna_app/core/presentation/widget/custom_app_bar.dart';
import 'package:bookna_app/core/resources/app_strings.dart';

class TopRatedBooksView extends StatelessWidget {
  const TopRatedBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.topRatedBooks),
      body:  TopRatedBooksContent(),
    );
  }
}
