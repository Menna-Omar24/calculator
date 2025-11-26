import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_font.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_string.dart';
import '../view_model/calculator_state.dart';

/// Display widget for showing calculator input and results
class DisplayWidget extends StatelessWidget {
  final CalculatorState state;

  const DisplayWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    String displayText;
    double fontSize;

    if (state is ErrorState) {
      displayText = AppString.error;
      fontSize = AppFont.displayLarge;
    } else if (state is ResultState) {
      displayText = state.calculation.result ?? AppString.zero;
      fontSize = AppFont.displayLarge;
    } else {
      displayText = state.calculation.displayString.isEmpty
          ? AppString.zero
          : state.calculation.displayString;
      fontSize = AppFont.displayMedium;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.displayPaddingH,
        vertical: AppSize.displayPaddingV,
      ),
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Text(
          displayText,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: AppFont.bold,
            color: AppColor.textPrimary,
            letterSpacing: 1.2,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}



