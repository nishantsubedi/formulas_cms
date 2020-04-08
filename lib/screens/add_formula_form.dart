import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:formulas_cms/blocs/add_formula_bloc.dart';
import 'package:formulas_cms/blocs/app_state_provider.dart';
import 'package:formulas_cms/blocs/formula_bloc.dart';
import 'package:formulas_cms/models/models.dart';
import 'package:formulas_cms/utils/colors.dart';
import 'package:formulas_cms/utils/fonts.dart';
import 'package:formulas_cms/utils/utils.dart';

class AddFormulaForm extends StatefulWidget {
  @override
  _AddFormulaFormState createState() => _AddFormulaFormState();
}

class _AddFormulaFormState extends State<AddFormulaForm> {
  AddFormulaBloc addFromBloc;
  FormulaBloc formulaBloc;
  TextEditingController _formulaController;

  @override
  void initState() {
    super.initState();
    addFromBloc = AddFormulaBloc();
    _formulaController = TextEditingController();
    formulaBloc = FormulaBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _formulaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppStateProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Add Formulas'),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Select Course: ',
                  style: AppFonts.h2,
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: appState.courseBloc.courses,
                    builder: (BuildContext context, List<Course> courses,
                        Widget child) {
                      if (courses == null) {
                        return SizedBox();
                      }
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: DropdownButton<Course>(
                            hint: ValueListenableBuilder(
                                valueListenable: addFromBloc.selectedCourse,
                                builder: (_, Course selectedCourse, __) {
                                  if (selectedCourse == null)
                                    return Text('Select a Course');
                                  return Text(selectedCourse.name);
                                }),
                            items: courses.map((Course value) {
                              return new DropdownMenuItem<Course>(
                                value: value,
                                child: new Text(value.name),
                              );
                            }).toList(),
                            onChanged: (course) {
                              addFromBloc.updateSelectedCourse(course);
                              appState.chapterBloc.getChapters(course.id);
                              addFromBloc.updateSelectedChapter(null);
                              formulaBloc.formula.value = null;
                            }),
                      );
                    }),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Select Chapter: ',
                  style: AppFonts.h2,
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: appState.chapterBloc.chapters,
                    builder: (BuildContext context, List<Chapter> chapters,
                        Widget child) {
                      if (chapters == null) {
                        return SizedBox();
                      }
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: DropdownButton<Chapter>(
                            hint: ValueListenableBuilder(
                                valueListenable: addFromBloc.selectedChapter,
                                builder: (_, Chapter selectedCourse, __) {
                                  if (selectedCourse == null)
                                    return Text('Select a Chapter');
                                  return Text(selectedCourse.name);
                                }),
                            items: chapters.map((Chapter value) {
                              return new DropdownMenuItem<Chapter>(
                                value: value,
                                child: new Text(value.name),
                              );
                            }).toList(),
                            onChanged: (chapter) {
                              addFromBloc.updateSelectedChapter(chapter);
                              formulaBloc.formula.value = null;
                              formulaBloc.getFormula(chapter.id);
                            }),
                      );
                    }),
              )
            ],
          ),
          ValueListenableBuilder(
              valueListenable: formulaBloc.formula,
              builder: (BuildContext context, Formula formula, Widget child) {
                _formulaController.text = formula?.content ?? '';
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Row(children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _formulaController,
                        maxLines: 20,
                        onChanged: (txt) {
                          addFromBloc.updateFormulaText(txt);
                        },
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                    Container(
                      height: 400,
                      width: 500,
                      child: ValueListenableBuilder(
                          valueListenable: addFromBloc.formulaText,
                          builder: (_, String formulaText, __) {
                            return Container(
                                key: UniqueKey(),
                                child: TeXView(
                                  // keepAlive: false,
                                  // key: UniqueKey(),

                                  teXHTML: formulaText ?? '<p>akjvjdv</p>',
                                  renderingEngine: RenderingEngine
                                      .Katex, // Katex for fast render and MathJax for quality render.
                                  loadingWidget: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ));
                          }),
                    ),
                  ]),
                );
              }),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: RaisedButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: AppColors.primaryColor,
                onPressed: () async {
                  if (addFromBloc.selectedChapter.value == null ||
                      addFromBloc.selectedCourse.value == null ||
                      addFromBloc.formulaText.value == null ||
                      addFromBloc.formulaText.value.isEmpty) {
                    return Toast()
                        .show('Please fill the form correctly', context);
                  }
                  LoadingOverlay.showLoadingOverlay(context);
                  bool resp;
                  if (formulaBloc.formula?.value?.content != null) {
                    resp =
                        await addFromBloc.update(formulaBloc.formula.value.id);
                  } else {
                    resp = await addFromBloc.submit();
                  }
                  LoadingOverlay.hideOverLay();
                  if (resp) {
                    if (formulaBloc.formula?.value?.content != null) {
                      Toast().show('Formula Updated Successfully', context);
                    } else {
                      Toast().show('Formula Added Successfully', context);
                    }
                    addFromBloc.reset();
                    _formulaController.clear();
                  } else {
                    Toast().show('Failed to add a new formula', context);
                  }
                },
                child: Text(
                  'Submit',
                  style: AppFonts.h3.copyWith(
                    color: AppColors.primaryWhite,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
