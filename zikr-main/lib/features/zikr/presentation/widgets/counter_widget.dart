// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:counter_app/core/constants/app_text_styles.dart';
import 'package:counter_app/features/zikr/controller/zikr_cubit.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    super.key,
    required this.cubit,
    required this.count,
  });

  final ZikrCubit cubit;
  final int count;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _rippleController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rippleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _rippleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
    _rippleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rippleController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rippleController.dispose();
    super.dispose();
  }

  void _onTap() {
    _scaleController.forward().then((_) {
      _scaleController.reverse();
    });
    _rippleController.forward().then((_) {
      _rippleController.reset();
    });
    widget.cubit.increment();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Counter Display
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Text(
            '${widget.count}',
            style: AppTextStyles.cairo48BoldWhite.copyWith(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: const Offset(2, 2),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.7),
                ),
              ],
            ),
          ),
        ),
        
        // Main Counter Button
        GestureDetector(
          onTap: _onTap,
          child: AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Ripple Effect
                    AnimatedBuilder(
                      animation: _rippleAnimation,
                      builder: (context, child) {
                        return Container(
                          width: 200 * _rippleAnimation.value,
                          height: 200 * _rippleAnimation.value,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(
                                0.5 * (1 - _rippleAnimation.value),
                              ),
                              width: 2,
                            ),
                          ),
                        );
                      },
                    ),
                    // Main Button
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.green.shade400,
                            Colors.green.shade600,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                          BoxShadow(
                            color: Colors.green.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.touch_app,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        
        const SizedBox(height: 30),
        
        // Action Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionButton(
              onPressed: widget.cubit.decrement,
              icon: Icons.remove,
              color: Colors.red,
              label: 'Decrease',
            ),
            _buildActionButton(
              onPressed: widget.cubit.reset,
              icon: Icons.refresh,
              color: Colors.orange,
              label: 'Reset',
            ),
            _buildActionButton(
              onPressed: widget.cubit.increment,
              icon: Icons.add,
              color: Colors.green,
              label: 'Increase',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required VoidCallback onPressed,
    required IconData icon,
    required Color color,
    required String label,
  }) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.2),
                border: Border.all(color: color.withOpacity(0.5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                icon,
                size: 30,
                color: color,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            shadows: [
              Shadow(
                offset: const Offset(1, 1),
                blurRadius: 2,
                color: Colors.black.withOpacity(0.7),
              ),
            ],
          ),
        ),
      ],
    );
  }
}