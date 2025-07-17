import 'package:cubit_task/controller/change_state.dart';
import 'package:flutter/material.dart';

class ColorCard extends StatelessWidget {
  final CounterState state;
  
  const ColorCard({super.key, required this.state});

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
          Text(
            'Color',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: state.color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: state.color.withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Icon(Icons.brush, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}