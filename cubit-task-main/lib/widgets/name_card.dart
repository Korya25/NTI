// ignore_for_file: deprecated_member_use

import 'package:cubit_task/controller/change_state.dart';
import 'package:flutter/material.dart';

class NameCard extends StatelessWidget {
  final CounterState state;

  const NameCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(Icons.person, size: 40, color: state.color),
          const SizedBox(height: 15),
          Text(
            'Name',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            state.text,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: state.color,
            ),
          ),
        ],
      ),
    );
  }
}
