import 'package:bmi_calculator/domain/bmr_calculator_model.dart';
import 'package:bmi_calculator/domain/bmr_form_model.dart';
import 'package:bmi_calculator/domain/calculator_model.dart';
import 'package:bmi_calculator/widgets/bmi_form.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _bmi;
  double? _bmr;

  BmrCalculator getBmrCalculatorMap(Gender g) {
    switch (g) {
      case Gender.male:
        return new MenBmrCalulator();
      default:
        return new WomenBmrCalculator();
    }
  }

  void calculateBmr(BmrFormModel form) {
    print('calculateBmr ${form.weight}');

    Calculator c = new Calculator(
      age: form.age,
      height: form.height,
      weight: form.weight,
      bmrCalculator: getBmrCalculatorMap(form.gender),
    );
    print('BMR is: ${c.calculateBmr()}');
    print('BMI is: ${c.calculateBmi()}');
    setState(() {
      _bmi = c.calculateBmi();
      _bmr = c.calculateBmr();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              BmiForm(
                callback: this.calculateBmr,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  _bmr != null
                      ? 'Your BMR is: ${_bmr.toString()} kcal/day'
                      : '',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  _bmi != null ? 'Your BMI is: $_bmi' : '',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
