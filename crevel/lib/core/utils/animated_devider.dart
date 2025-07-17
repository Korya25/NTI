// ignore_for_file: deprecated_member_use

import 'package:crevel/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AnimatedDivider extends StatefulWidget {
  const AnimatedDivider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedDividerState createState() => _AnimatedDividerState();
}

class _AnimatedDividerState extends State<AnimatedDivider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // تشغيل الأنيميشن عند ظهور الWidget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width:
                      MediaQuery.of(context).size.width *
                      0.8 *
                      _animation.value,
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppColors.primaryText.withOpacity(0.3),
                        AppColors.primaryText.withOpacity(0.7),
                        AppColors.primaryText.withOpacity(0.3),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.primaryText.withOpacity(
                          _animation.value > (index * 0.3) ? 0.6 : 0.2,
                        ),
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),

                SizedBox(height: 10),

                Container(
                  width:
                      MediaQuery.of(context).size.width *
                      0.6 *
                      _animation.value,
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppColors.primaryText.withOpacity(0.2),
                        AppColors.primaryText.withOpacity(0.5),
                        AppColors.primaryText.withOpacity(0.2),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
