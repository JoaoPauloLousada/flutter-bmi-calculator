import 'package:bmi_calculator/domain/bmr_calculator_model.dart';
import 'package:bmi_calculator/widgets/bmi_form.dart';

class BmrFormModel {
  int age;
  double height;
  double weight;
  Gender gender;

  BmrFormModel({
    this.age = 0,
    this.height = 0,
    this.weight = 0,
    this.gender = Gender.male,
  });
}
