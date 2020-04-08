import 'package:flutter/material.dart';

import 'package:formulas_cms/blocs/app_state_provider.dart';
import 'package:formulas_cms/screens/add_formula_form.dart';
import 'package:formulas_cms/utils/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppStateProvider(
      child: MaterialApp(
      color: AppColors.primaryColor,
      title: 'Formulas Point',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
      ),
       home: AddFormulaForm(),
    ));
  }
}
