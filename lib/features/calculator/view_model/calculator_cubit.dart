import 'package:flutter_bloc/flutter_bloc.dart';
import 'calculator_state.dart';
import 'calculator_presenter.dart';

/// Cubit for managing calculator state
class CalculatorCubit extends Cubit<CalculatorState> {
  final CalculatorPresenter _presenter;

  CalculatorCubit(this._presenter) : super(const IdleState());

  /// Handles number input
  void inputNumber(String number) {
    final newState = _presenter.handleNumberInput(state.calculation, number);
    emit(newState);
  }

  /// Handles operator input
  void inputOperator(String operator) {
    final newState = _presenter.handleOperatorInput(state.calculation, operator);
    emit(newState);
  }

  /// Handles decimal point input
  void inputDecimal() {
    final newState = _presenter.handleDecimalInput(state.calculation);
    emit(newState);
  }

  /// Calculates the result
  void calculate() {
    final newState = _presenter.calculate(state.calculation);
    emit(newState);
  }

  /// Clears the calculator
  void clear() {
    emit(const IdleState());
  }

  /// Deletes the last character
  void delete() {
    final newState = _presenter.handleDelete(state.calculation);
    emit(newState);
  }

  /// Handles percentage calculation
  void inputPercentage() {
    final newState = _presenter.handlePercentage(state.calculation);
    emit(newState);
  }

  /// Handles parentheses (toggle sign/negate)
  void inputParentheses() {
    final newState = _presenter.handleParentheses(state.calculation);
    emit(newState);
  }
}


