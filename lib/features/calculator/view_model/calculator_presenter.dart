import '../../../models/calculation_model.dart';
import 'calculator_state.dart';

/// Presenter for calculator business logic
class CalculatorPresenter {
  /// Handles number input
  CalculatorState handleNumberInput(
    CalculationModel calculation,
    String number,
  ) {
    // If we have a result, start fresh
    if (calculation.result != null) {
      return InputState(CalculationModel(firstNumber: number));
    }

    // If we have an operator, input goes to second number
    if (calculation.operator != null) {
      final currentSecond = calculation.secondNumber ?? '';
      // Allow multi-digit numbers for second number
      return InputState(
        calculation.copyWith(secondNumber: currentSecond + number),
      );
    }

    // Otherwise, input goes to first number
    final currentFirst = calculation.firstNumber ?? '';
    // Allow multi-digit numbers for first number
    return InputState(
      calculation.copyWith(firstNumber: currentFirst + number),
    );
  }

  /// Handles operator input
  CalculatorState handleOperatorInput(
    CalculationModel calculation,
    String operator,
  ) {
    // If we have a result, use it as first number
    if (calculation.result != null) {
      return InputState(
        CalculationModel(
          firstNumber: calculation.result,
          operator: operator,
        ),
      );
    }

    // If we already have an operator and second number, calculate first
    if (calculation.operator != null && calculation.secondNumber != null) {
      final result = _performCalculation(calculation);
      if (result is ErrorState) {
        return result;
      }
      final resultValue = (result as ResultState).calculation.result!;
      return InputState(
        CalculationModel(
          firstNumber: resultValue,
          operator: operator,
        ),
      );
    }

    // If we have a first number, set the operator
    if (calculation.firstNumber != null) {
      return InputState(calculation.copyWith(operator: operator));
    }

    return InputState(calculation);
  }

  /// Handles decimal point input
  CalculatorState handleDecimalInput(CalculationModel calculation) {
    // If we have a result, start fresh
    if (calculation.result != null) {
      return InputState(CalculationModel(firstNumber: '0.'));
    }

    // If we have an operator, add decimal to second number
    if (calculation.operator != null) {
      final currentSecond = calculation.secondNumber ?? '';
      if (currentSecond.contains('.')) {
        return InputState(calculation); // Already has decimal
      }
      return InputState(
        calculation.copyWith(secondNumber: currentSecond.isEmpty ? '0.' : '$currentSecond.'),
      );
    }

    // Otherwise, add decimal to first number
    final currentFirst = calculation.firstNumber ?? '';
    if (currentFirst.contains('.')) {
      return InputState(calculation); // Already has decimal
    }
    return InputState(
      calculation.copyWith(firstNumber: currentFirst.isEmpty ? '0.' : '$currentFirst.'),
    );
  }

  /// Handles delete/backspace
  CalculatorState handleDelete(CalculationModel calculation) {
    // If we have a result, clear everything
    if (calculation.result != null) {
      return const IdleState();
    }

    // If we have a second number, delete from it
    if (calculation.secondNumber != null && calculation.secondNumber!.isNotEmpty) {
      final newSecond = calculation.secondNumber!.substring(
        0,
        calculation.secondNumber!.length - 1,
      );
      return InputState(
        calculation.copyWith(
          secondNumber: newSecond.isEmpty ? null : newSecond,
        ),
      );
    }

    // If we have an operator, remove it
    if (calculation.operator != null) {
      return InputState(calculation.copyWith(operator: null));
    }

    // If we have a first number, delete from it
    if (calculation.firstNumber != null && calculation.firstNumber!.isNotEmpty) {
      final newFirst = calculation.firstNumber!.substring(
        0,
        calculation.firstNumber!.length - 1,
      );
      return InputState(
        calculation.copyWith(
          firstNumber: newFirst.isEmpty ? null : newFirst,
        ),
      );
    }

    return const IdleState();
  }

  /// Performs the calculation
  CalculatorState calculate(CalculationModel calculation) {
    if (!calculation.isComplete) {
      return InputState(calculation);
    }

    try {
      final first = double.parse(calculation.firstNumber!);
      final second = double.parse(calculation.secondNumber!);
      final operator = calculation.operator!;

      double result;

      switch (operator) {
        case '+':
          result = first + second;
          break;
        case '-':
          result = first - second;
          break;
        case '*':
          result = first * second;
          break;
        case '/':
          if (second == 0) {
            return const ErrorState('Division by zero');
          }
          result = first / second;
          break;
        default:
          return InputState(calculation);
      }

      // Format result to remove unnecessary decimals
      final resultString = result % 1 == 0
          ? result.toInt().toString()
          : result.toStringAsFixed(10).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');

      return ResultState(
        calculation.copyWith(result: resultString),
      );
    } catch (e) {
      return const ErrorState('Invalid calculation');
    }
  }

  /// Performs calculation and returns state (used internally)
  CalculatorState _performCalculation(CalculationModel calculation) {
    return calculate(calculation);
  }

  /// Handles percentage calculation
  CalculatorState handlePercentage(CalculationModel calculation) {
    // If we have a result, calculate percentage of it
    if (calculation.result != null) {
      try {
        final value = double.parse(calculation.result!);
        final percentage = value / 100;
        final resultString = percentage % 1 == 0
            ? percentage.toInt().toString()
            : percentage.toStringAsFixed(10).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
        return ResultState(
          CalculationModel(result: resultString),
        );
      } catch (e) {
        return const ErrorState('Invalid calculation');
      }
    }

    // If we have a second number, calculate percentage of it
    if (calculation.secondNumber != null) {
      try {
        final value = double.parse(calculation.secondNumber!);
        final percentage = value / 100;
        final resultString = percentage % 1 == 0
            ? percentage.toInt().toString()
            : percentage.toStringAsFixed(10).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
        return InputState(
          calculation.copyWith(secondNumber: resultString),
        );
      } catch (e) {
        return const ErrorState('Invalid calculation');
      }
    }

    // If we have a first number, calculate percentage of it
    if (calculation.firstNumber != null) {
      try {
        final value = double.parse(calculation.firstNumber!);
        final percentage = value / 100;
        final resultString = percentage % 1 == 0
            ? percentage.toInt().toString()
            : percentage.toStringAsFixed(10).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
        return InputState(
          calculation.copyWith(firstNumber: resultString),
        );
      } catch (e) {
        return const ErrorState('Invalid calculation');
      }
    }

    return InputState(calculation);
  }

  /// Handles parentheses (toggle sign/negate)
  CalculatorState handleParentheses(CalculationModel calculation) {
    // If we have a result, negate it
    if (calculation.result != null) {
      try {
        final value = double.parse(calculation.result!);
        final negated = -value;
        final resultString = negated % 1 == 0
            ? negated.toInt().toString()
            : negated.toStringAsFixed(10).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
        return ResultState(
          CalculationModel(result: resultString),
        );
      } catch (e) {
        return const ErrorState('Invalid calculation');
      }
    }

    // If we have a second number, negate it
    if (calculation.secondNumber != null) {
      try {
        final value = double.parse(calculation.secondNumber!);
        final negated = -value;
        final resultString = negated % 1 == 0
            ? negated.toInt().toString()
            : negated.toStringAsFixed(10).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
        return InputState(
          calculation.copyWith(secondNumber: resultString),
        );
      } catch (e) {
        return const ErrorState('Invalid calculation');
      }
    }

    // If we have a first number, negate it
    if (calculation.firstNumber != null) {
      try {
        final value = double.parse(calculation.firstNumber!);
        final negated = -value;
        final resultString = negated % 1 == 0
            ? negated.toInt().toString()
            : negated.toStringAsFixed(10).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
        return InputState(
          calculation.copyWith(firstNumber: resultString),
        );
      } catch (e) {
        return const ErrorState('Invalid calculation');
      }
    }

    // If empty, start with negative sign
    return InputState(const CalculationModel(firstNumber: '-'));
  }
}


