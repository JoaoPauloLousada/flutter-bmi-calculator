import 'package:bmi_calculator/domain/bmr_form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

enum Gender { male, female }

class BmiForm extends StatefulWidget {
  final Function callback;

  BmiForm({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  _BmiFormState createState() => _BmiFormState();
}

class _BmiFormState extends State<BmiForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Gender _gender = Gender.male;
  BmrFormModel _bmrForm = new BmrFormModel();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Column(
          children: [
            Column(
              children: [
                Text('Gender'),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Male'),
                    leading: Radio<Gender>(
                      value: Gender.male,
                      groupValue: _gender,
                      onChanged: (Gender? val) {
                        setState(() {
                          _bmrForm.gender = val ?? Gender.male;
                          _gender = val ?? Gender.male;
                        });
                        print('change gender to $val');
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Female'),
                    leading: Radio<Gender>(
                      value: Gender.female,
                      groupValue: _gender,
                      onChanged: (Gender? val) {
                        setState(() {
                          _bmrForm.gender = val ?? Gender.female;
                          _gender = val ?? Gender.female;
                        });
                        print('change gender to $val');
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (val) {
                if (val == null || val.isEmpty) return 'Please enter some age.';
                if (int.parse(val) < 10 || int.parse(val) >= 100)
                  return 'Age must be greater than 10 or lower than 100.';
                return null;
              },
              onSaved: (val) {
                if (val != null) _bmrForm.age = int.parse(val);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Height',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (val) {
                if (val == null || val.isEmpty)
                  return 'Please enter the height.';
                return null;
              },
              onSaved: (val) {
                if (val != null) _bmrForm.height = double.parse(val);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Weight',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (val) {
                if (val == null || val.isEmpty)
                  return 'Please enter the weight.';
                return null;
              },
              onSaved: (val) {
                if (val != null) _bmrForm.weight = double.parse(val);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print('submit ${_formKey.currentState}');
                  _formKey.currentState!.save();
                  widget.callback(_bmrForm);
                }
              },
              child: Text('Submit'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(140.0, 48.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
