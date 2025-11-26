import 'package:flutter/material.dart';
import '../utils/app_color.dart';
import '../utils/app_font.dart';

/// Application theme configuration
class AppTheme {
  /// Material 3 Theme
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: AppColor.purple1,
        secondary: AppColor.pink1,
        surface: AppColor.darkBackground2,
        error: AppColor.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: AppColor.darkBackground1,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      textTheme: TextTheme(
        displayLarge: AppFont.displayLargeStyle.copyWith(
          color: AppColor.textPrimary,
        ),
        displayMedium: AppFont.displayMediumStyle.copyWith(
          color: AppColor.textPrimary,
        ),
        bodyLarge: AppFont.bodyLargeStyle.copyWith(
          color: AppColor.textPrimary,
        ),
        bodyMedium: AppFont.bodyMediumStyle.copyWith(
          color: AppColor.textSecondary,
        ),
      ),
    );
  }
}


