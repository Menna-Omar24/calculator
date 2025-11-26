import 'package:equatable/equatable.dart';
import '../../../models/calculation_model.dart';

/// Base state class for calculator
abstract class CalculatorState extends Equatable {
  final CalculationModel calculation;

  const CalculatorState(this.calculation);

  @override
  List<Object?> get props => [calculation];
}

/// Initial idle state
class IdleState extends CalculatorState {
  const IdleState() : super(const CalculationModel());
}

/// State when user is inputting numbers
class InputState extends CalculatorState {
  const InputState(CalculationModel calculation) : super(calculation);
}

/// State when calculation result is displayed
class ResultState extends CalculatorState {
  const ResultState(CalculationModel calculation) : super(calculation);
}

/// State when an error occurs (e.g., division by zero)
class ErrorState extends CalculatorState {
  final String errorMessage;

  const ErrorState(this.errorMessage) 
      : super(const CalculationModel(result: 'Error'));

  @override
  List<Object?> get props => [errorMessage, calculation];
}



