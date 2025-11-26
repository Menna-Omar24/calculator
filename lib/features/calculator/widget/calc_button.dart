import 'package:flutter/material.dart';

import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_font.dart';
import '../../../core/utils/app_size.dart';

/// Custom calculator button with gradient styling
class CalcButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isOperator;
  final bool isSpecial; // For C, DEL, = buttons

  const CalcButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isOperator = false,
    this.isSpecial = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.radiusL),
        gradient: isSpecial || isOperator
            ? AppColor.buttonGradient
            : null,
        color: isSpecial || isOperator
            ? null
            : Colors.white.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(AppSize.radiusL),
          splashColor: AppColor.pink1.withOpacity(0.3),
          highlightColor: AppColor.purple1.withOpacity(0.2),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(AppSize.buttonPadding),
            child: Text(
              label,
              style: AppFont.buttonStyle.copyWith(
                color: AppColor.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}



