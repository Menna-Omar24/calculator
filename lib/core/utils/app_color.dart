import 'package:flutter/material.dart';

/// Application color palette and gradients
class AppColor {
  // Dark Background Colors
  static const Color darkBackground1 = Color(0xFF0A0F1F);
  static const Color darkBackground2 = Color(0xFF0E1226);
  static const Color darkBackground3 = Color(0xFF12182B);

  // Pink / Magenta Colors
  static const Color pink1 = Color(0xFFFF4DC4);
  static const Color pink2 = Color(0xFFFC4AB8);

  // Mauve / Purple Colors
  static const Color purple1 = Color(0xFFA36BFF);
  static const Color purple2 = Color(0xFF9B4DFF);
  static const Color purple3 = Color(0xFFB072FF);

  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textTertiary = Color(0xFF808080);

  // Accent Colors
  static const Color accent = purple1;
  static const Color accentSecondary = pink1;

  // Error Colors
  static const Color error = Colors.red;
  static const Color errorLight = Color(0xFFFF5252);

  // Success Colors
  static const Color success = Colors.green;
  static const Color successLight = Color(0xFF4CAF50);

  // Gradients
  /// App Background Gradient: #0A0F1F → #12182B
  static const LinearGradient appBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [darkBackground1, darkBackground3],
  );

  /// Button Gradient (Pink → Purple): #FC4AB8 → #9B4DFF
  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [pink2, purple2],
  );

  /// Main Accent Gradient: #FF4DC4 → #B072FF
  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [pink1, purple3],
  );

  // Opacity variants
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
}

