import 'package:flutter/material.dart';
import '../../features/calculator/view/splash_screen.dart';
import '../theme/app_theme.dart';

/// Main application widget
class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const SplashScreen(),
    );
  }
}

