import 'package:flutter/cupertino.dart';
import 'package:formulas_cms/actions/actions.dart';
import 'package:formulas_cms/models/models.dart';

class AddFormulaBloc extends Object {
  var _courseAction = CourseAction();
  var _chapterAction = ChapterAction();
  var _formulaAction = FormulaAction();

  ValueNotifier<Course> selectedCourse = ValueNotifier(null);

  updateSelectedCourse(Course c) => this.selectedCourse.value = c;

  ValueNotifier<Chapter> selectedChapter = ValueNotifier(null);

  updateSelectedChapter(Chapter c) => this.selectedChapter.value = c;

  ValueNotifier<String> formulaText = ValueNotifier(null);

  updateFormulaText(String txt) => this.formulaText.value = txt;

  Future<bool> submit() async {
    var formulaData = {
      "chapter_id": this.selectedChapter.value.id,
      "content": this.formulaText.value
    };

    
    var resp = await _formulaAction.addFormula(formulaData);
    return resp;
  }


  Future<bool> update(String id) async {
    var formulaData = {
      "chapter_id": this.selectedChapter.value.id,
      "content": this.formulaText.value
    };

    
    var resp = await _formulaAction.updateFormula(id, formulaData);
    return resp;
  }



  reset() {
    this.selectedChapter.value = null;
    this.selectedCourse.value = null;
    this.formulaText.value = null;
  }
}
