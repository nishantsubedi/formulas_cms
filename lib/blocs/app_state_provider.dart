
import 'package:flutter/cupertino.dart';
import 'package:formulas_cms/blocs/blocs.dart';
import 'package:formulas_cms/blocs/formula_bloc.dart';


class AppStateProvider extends InheritedWidget {

  final AppState state;

  AppStateProvider({Key key, Widget child}) : state = AppState(), super(key:key, child: child);


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateProvider>().state;
  }


}


class AppState extends Object {

  CourseBloc courseBloc = CourseBloc();
  ChapterBloc chapterBloc = ChapterBloc();
  FormulaBloc formulaBloc = FormulaBloc();
  
}