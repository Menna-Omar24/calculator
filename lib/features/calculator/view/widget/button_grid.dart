import 'package:flutter/material.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/app_string.dart';
import '../../widget/calc_button.dart';
import '../../view_model/calculator_cubit.dart';

/// Button grid widget for calculator
class ButtonGrid extends StatelessWidget {
  final CalculatorCubit cubit;

  const ButtonGrid({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow1(),
        const SizedBox(height: AppSize.spacingM),
        _buildRow2(),
        const SizedBox(height: AppSize.spacingM),
        _buildRow3(),
        const SizedBox(height: AppSize.spacingM),
        _buildRow4(),
        const SizedBox(height: AppSize.spacingM),
        _buildRow5(),
      ],
    );
  }

  Widget _buildRow1() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: CalcButton(
              label: AppString.clear,
              isSpecial: true,
              onPressed: () => cubit.clear(),
            ),
          ),
          const SizedBox(width: AppSize.spacingM),
          Expanded(
            child: CalcButton(
              label: AppString.parentheses,
              isSpecial: true,
              onPressed: () => cubit.inputParentheses(),
            ),
          ),
          const SizedBox(width: AppSize.spacingM),
          Expanded(
            child: CalcButton(
              label: AppString.percentage,
              isOperator: true,
              onPressed: () => cubit.inputPercentage(),
            ),
          ),
          const SizedBox(width: AppSize.spacingM),
          Expanded(
            child: CalcButton(
              label: AppString.divide,
              isOperator: true,
              onPressed: () => cubit.inputOperator(AppString.divide),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow2() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: CalcButton(
              label: AppString.seven,
              onPressed: () => cubit.inputNumber(AppString.seven),
            ),
          ),
          const SizedBox(width: AppSize.spacingM),
          Expanded(
            child: CalcButton(
              label: AppString.eight,
              onPressed: () => cubit.inputNumber(AppString.eight),
            ),
          ),
          const SizedBox(width: AppSize.spacingM),
          Expanded(
            child: CalcButton(
              label: AppString.nine,
              onPressed: () => cubit.inputNumber(AppString.nine),
            ),
          ),
          const SizedBox(width: AppSize.spacingM),
          Expanded(
            child: CalcButton(
              label: AppString.multiply,
              isOperator: true,
              onPressed: () => cubit.inputOperator(AppString.multiply),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow3() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: CalcButton(
              label: AppString.four,
              onPressed: () => cubit.inputNumber(AppString.four),
            ),
          ),
          const SizedBox(width: AppSize.spacingM),
          Expanded(
            child: CalcButton(
              label: AppString.five,
              onPressed: () => cubit.inputNumber(AppString.five),
            ),
          ),
          const SizedBox(width: AppSize.spacingM),
          Expanded(
            child: CalcButton(
              label: AppString.six,
              onPressed: () => cubit.inputNumber(AppString.six),
            ),
          ),
          const SizedBox(width: AppSize.spacingM),
          Expanded(
            child: CalcButton(
              label: AppString.subtract,
              isOperator: true,
              onPressed: () => cubit.inputOperator(AppString.subtract),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow4() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: CalcButton(
              label: AppString.one,
              onPressed: () => cubit.inputNumber(AppString.one),
            ),
          ),
          const SizedBox(width: AppSize.spacingM),
          Expanded(
            child: CalcButton(
              label: AppString.two,
              onPressed: () => cubit.inputNumber(AppString.two),
            ),
          ),
          const SizedBox(width: AppSize.spacingM),
          Expanded(
            child: CalcButton(
              label: AppString.three,
              onPressed: () => cubit.inputNumber(AppString.three),
            ),
          ),
          const SizedBox(width: AppSize.spacingM),
          Expanded(
            child: CalcButton(
              label: AppString.add,
              isOperator: true,
              onPressed: () => cubit.inputOperator(AppString.add),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow5() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: CalcButton(
              label: AppString.zero,
              onPressed: () => cubit.inputNumber(AppString.zero),
            ),
          ),
          const SizedBox(width: AppSize.spacingM),
          Expanded(
            child: CalcButton(
              label: AppString.decimal,
              onPressed: () => cubit.inputDecimal(),
            ),
          ),
          const SizedBox(width: AppSize.spacingM),
          Expanded(
            child: CalcButton(
              label: AppString.delete,
              isSpecial: true,
              onPressed: () => cubit.delete(),
            ),
          ),
          const SizedBox(width: AppSize.spacingM),
          Expanded(
            child: CalcButton(
              label: AppString.equals,
              isSpecial: true,
              onPressed: () => cubit.calculate(),
            ),
          ),
        ],
      ),
    );
  }
}


