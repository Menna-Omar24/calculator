import 'package:flutter/material.dart';
import 'app_font_size.dart';
import 'app_font_weight.dart';
import 'app_text_style.dart';

/// Application font utilities (backward compatibility)
class AppFont {
  // Font Sizes (delegated to AppFontSize)
  static const double displayLarge = AppFontSize.displayLarge;
  static const double displayMedium = AppFontSize.displayMedium;
  static const double displaySmall = AppFontSize.displaySmall;
  static const double bodyLarge = AppFontSize.bodyLarge;
  static const double bodyMedium = AppFontSize.bodyMedium;
  static const double bodySmall = AppFontSize.bodySmall;
  static const double button = AppFontSize.button;
  static const double caption = AppFontSize.caption;

  // Font Weights (delegated to AppFontWeight)
  static const FontWeight light = AppFontWeight.light;
  static const FontWeight regular = AppFontWeight.regular;
  static const FontWeight medium = AppFontWeight.medium;
  static const FontWeight semiBold = AppFontWeight.semiBold;
  static const FontWeight bold = AppFontWeight.bold;

  // Text Styles (delegated to AppTextStyle)
  static const TextStyle displayLargeStyle = AppTextStyle.displayLarge;
  static const TextStyle displayMediumStyle = AppTextStyle.displayMedium;
  static const TextStyle bodyLargeStyle = AppTextStyle.bodyLarge;
  static const TextStyle bodyMediumStyle = AppTextStyle.bodyMedium;
  static const TextStyle buttonStyle = AppTextStyle.button;
}

