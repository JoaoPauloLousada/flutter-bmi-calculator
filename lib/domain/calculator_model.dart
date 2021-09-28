import 'package:bmi_calculator/domain/bmr_calculator_model.dart';
import 'package:bmi_calculator/widgets/bmi_form.dart';

class Calculator {
  final int age;
  final double height;
  final double weight;
  final BmrCalculator bmrCalculator;

  Calculator({
    required this.age,
    required this.height,
    required this.weight,
    required this.bmrCalculator,
  });

  double calculateBmi() {
    return this.weight / (this.height * this.height) * 10000.0;
  }

  double calculateBmr() {
    return this.bmrCalculator.calculateBmr(this);
  }
}
