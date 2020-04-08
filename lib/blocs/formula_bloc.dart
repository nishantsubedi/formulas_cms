import 'package:flutter/cupertino.dart';
import 'package:formulas_cms/actions/actions.dart';
import 'package:formulas_cms/models/models.dart';


class FormulaBloc extends Object {
  ValueNotifier<Formula> formula = ValueNotifier(null);

  getFormula(String chapterId) async {
    this.formula.value = null;
    var resp = await FormulaAction().getFormula(chapterId);
    this.formula.value = resp;
  }
}