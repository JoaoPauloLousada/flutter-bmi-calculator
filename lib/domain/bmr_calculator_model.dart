import 'package:bmi_calculator/domain/calculator_model.dart';
import 'package:bmi_calculator/widgets/bmi_form.dart';

abstract class BmrCalculator {
  double calculateBmr(Calculator c);
}

class MenBmrCalulator implements BmrCalculator {
  double calculateBmr(Calculator c) {
    return (13.397 * c.weight) + (4.799 * c.height) - (5.677 * c.age) + 88.362;
  }
}

class WomenBmrCalculator implements BmrCalculator {
  double calculateBmr(Calculator c) {
    return (9.247 * c.weight) + (3.098 * c.height) - (4.330 * c.age) + 447.593;
  }
}
