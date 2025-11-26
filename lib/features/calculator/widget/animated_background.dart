import 'dart:math';
import 'package:flutter/material.dart';

import '../../../core/utils/app_color.dart';

/// Animated background with moving dots/stars
class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Dot> _dots = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    // Create random dots
    for (int i = 0; i < 80; i++) {
      _dots.add(Dot(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: _random.nextDouble() * 2.5 + 0.5,
        colorIndex: _random.nextInt(3),
        speed: _random.nextDouble() * 0.3 + 0.05,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: DotsPainter(_dots, _controller.value),
          child: Container(),
        );
      },
    );
  }
}

class Dot {
  double x;
  double y;
  double size;
  int colorIndex;
  double speed;

  Dot({
    required this.x,
    required this.y,
    required this.size,
    required this.colorIndex,
    required this.speed,
  });
}

class DotsPainter extends CustomPainter {
  final List<Dot> dots;
  final double animationValue;
  final Random _random = Random();

  DotsPainter(this.dots, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final colors = [
      AppColor.pink1,
      AppColor.purple1,
      AppColor.purple3,
    ];

    for (var dot in dots) {
      // Move dot downward with slight horizontal drift
      dot.y += dot.speed * 0.008;
      dot.x += (dot.speed - 0.2) * 0.002; // Slight horizontal movement
      
      if (dot.y > 1.2) {
        dot.y = -0.2;
        dot.x = _random.nextDouble();
      }
      if (dot.x < -0.1) dot.x = 1.1;
      if (dot.x > 1.1) dot.x = -0.1;

      // Draw dot with glow effect
      final opacity = (dot.y < 0 || dot.y > 1) 
          ? 0.0 
          : (dot.y < 0.1 || dot.y > 0.9) 
              ? 0.3 
              : 0.6;
      
      final paint = Paint()
        ..color = colors[dot.colorIndex].withOpacity(opacity)
        ..style = PaintingStyle.fill;

      // Draw glow effect first
      if (opacity > 0) {
        final glowPaint = Paint()
          ..color = colors[dot.colorIndex].withOpacity(opacity * 0.3)
          ..style = PaintingStyle.fill;
        canvas.drawCircle(
          Offset(dot.x * size.width, dot.y * size.height),
          dot.size * 2.5,
          glowPaint,
        );
      }

      // Draw main dot
      if (opacity > 0) {
        canvas.drawCircle(
          Offset(dot.x * size.width, dot.y * size.height),
          dot.size,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(DotsPainter oldDelegate) => true;
}



