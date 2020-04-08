import 'package:flutter/cupertino.dart';
import 'package:formulas_cms/actions/actions.dart';
import 'package:formulas_cms/models/models.dart';

class CourseBloc extends Object {
  ValueNotifier<List<Course>> courses = ValueNotifier(null);

  CourseBloc() {
    this.getCourses();
  }

  getCourses() async {
    var courseResp = await CourseAction().getCourse();
    this.courses.value = courseResp;
  }
}
