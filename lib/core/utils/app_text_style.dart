import 'package:flutter/material.dart';
import 'app_font_size.dart';
import 'app_font_weight.dart';
import 'app_color.dart';

/// Application text styles
class AppTextStyle {
  static const TextStyle displayLarge = TextStyle(
    fontSize: AppFontSize.displayLarge,
    fontWeight: AppFontWeight.bold,
    letterSpacing: 1.2,
    color: AppColor.textPrimary,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: AppFontSize.displayMedium,
    fontWeight: AppFontWeight.bold,
    letterSpacing: 1.0,
    color: AppColor.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: AppFontSize.bodyLarge,
    fontWeight: AppFontWeight.regular,
    color: AppColor.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: AppFontSize.bodyMedium,
    fontWeight: AppFontWeight.regular,
    color: AppColor.textSecondary,
  );

  static const TextStyle button = TextStyle(
    fontSize: AppFontSize.button,
    fontWeight: AppFontWeight.bold,
    color: AppColor.textPrimary,
  );
}



