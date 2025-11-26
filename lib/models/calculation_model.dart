/// Model representing a calculation expression
class CalculationModel {
  final String? firstNumber;
  final String? operator;
  final String? secondNumber;
  final String? result;

  const CalculationModel({
    this.firstNumber,
    this.operator,
    this.secondNumber,
    this.result,
  });

  /// Creates a copy with updated values
  CalculationModel copyWith({
    String? firstNumber,
    String? operator,
    String? secondNumber,
    String? result,
  }) {
    return CalculationModel(
      firstNumber: firstNumber ?? this.firstNumber,
      operator: operator ?? this.operator,
      secondNumber: secondNumber ?? this.secondNumber,
      result: result ?? this.result,
    );
  }

  /// Gets the current display string
  String get displayString {
    if (result != null) {
      return result!;
    }
    
    final buffer = StringBuffer();
    if (firstNumber != null) {
      buffer.write(firstNumber);
    }
    if (operator != null) {
      buffer.write(' $operator ');
    }
    if (secondNumber != null) {
      buffer.write(secondNumber);
    }
    
    return buffer.toString();
  }

  /// Checks if the calculation is complete (has both numbers and operator)
  bool get isComplete => 
      firstNumber != null && 
      operator != null && 
      secondNumber != null;

  /// Checks if the calculation is empty
  bool get isEmpty => 
      firstNumber == null && 
      operator == null && 
      secondNumber == null;
}



