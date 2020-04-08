import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:formulas_cms/blocs/blocs.dart';
import 'package:formulas_cms/models/models.dart';
import 'package:formulas_cms/utils/app_icons.dart';
import 'package:formulas_cms/utils/colors.dart';
import 'package:formulas_cms/utils/fonts.dart';
import 'package:formulas_cms/utils/utils.dart';


class FormulaScreen extends StatefulWidget {
  final Chapter chapter;
  final AppState appState;

  const FormulaScreen({Key key, this.chapter, this.appState}) : super(key: key);

  @override
  _FormulaScreenState createState() => _FormulaScreenState();
}

class _FormulaScreenState extends State<FormulaScreen> {

  @override
  void initState() {
    super.initState();
    widget.appState.formulaBloc.getFormula(widget.chapter.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: BizWizIcon(
                icon: AppIcons.back,
                width: deviceExactWidth(45, context),
              ),
              onPressed: () {
                if (Navigator.canPop(context)) Navigator.pop(context);
              }),
          title: Text(
            this.widget.chapter.name,
            style: AppFonts.h1.copyWith(
                fontWeight: FontWeight.normal, color: AppColors.primaryWhite),
          ),
          actions: <Widget>[
            IconButton(
                icon: BizWizIcon(
                  icon: AppIcons.menu,
                  width: deviceExactWidth(45, context),
                ),
                onPressed: () {})
          ],
          backgroundColor: AppColors.primaryColor,
        ),
        body: ValueListenableBuilder(
        valueListenable: widget.appState.formulaBloc.formula, 
        
        builder: (BuildContext context, Formula formula, Widget child){

          if(formula == null) {
            return Center(child: CircularProgressIndicator());
          }
        return
         TeXView(
          // teXHTML: r"""$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$<br> """,
          teXHTML: formula.content,
          renderingEngine: RenderingEngine
              .Katex, // Katex for fast render and MathJax for quality render.
          loadingWidget: Center(
            child: CircularProgressIndicator(),
          ),
          onRenderFinished: (height) {
          },
          onPageFinished: (string) {
          },
        );
        
      }),
    );
  }
}
