
import 'package:characters_app/features/home/data/char_data.dart';
import 'package:characters_app/features/home/model/char_model.dart';
import 'package:characters_app/features/home/presentation/widgets/char_continer.dart';
import 'package:characters_app/features/home/presentation/widgets/custom_char_text.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatefulWidget {
  final List<CharModel> chars = CharData.getChars();
  CustomGridView({super.key});

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: widget.chars.length,
      itemBuilder: (context, index) {
        final char = widget.chars[index];
        return CharContiner(
          textWidget: Center(child: CustomCharText(char: char)),
          backgroundColor: char.backgroundColor,
        );
      },
    );
  }
}
