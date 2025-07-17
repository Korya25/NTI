// ignore_for_file: deprecated_member_use

import 'package:cubit_task/controller/change_state.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final CounterState state;

  const HomeAppBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Counter',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: const Offset(2, 2),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: state.color.withOpacity(0.3),
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                width: 2,
              ),
            ),
            child: const Icon(Icons.palette, color: Colors.white, size: 24),
          ),
        ],
      ),
    );
  }
}
