import 'package:flutter/material.dart';

class IOSBackButton extends StatelessWidget {
  final String? text;
  final Color color;
  final VoidCallback? onPressed;
  final double iconSize;

  const IOSBackButton({
    super.key,
    this.text,
    this.color = Colors.grey,
    this.onPressed,
    this.iconSize = 35.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => Navigator.maybePop(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.arrow_back_ios, size: iconSize, color: color),
          if (text != null) ...[
            const SizedBox(width: 4),
            Text(
              text!,
              style: TextStyle(
                fontSize: iconSize * 0.7,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
