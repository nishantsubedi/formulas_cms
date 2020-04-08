import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formulas_cms/blocs/blocs.dart';
import 'package:formulas_cms/models/models.dart';
import 'package:formulas_cms/screens/formula_screen.dart';
import 'package:formulas_cms/utils/app_icons.dart';
import 'package:formulas_cms/utils/colors.dart';
import 'package:formulas_cms/utils/fonts.dart';
import 'package:formulas_cms/utils/utils.dart';
import 'package:formulas_cms/widgets/search_list.dart';

InputBorder _inputBorder =  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9));


class FormulasList extends StatefulWidget {
  final String title;
  final AppState appState;
  final String icon;

  const FormulasList({Key key, this.icon, this.appState, this.title}) : super(key: key);

  @override
  _FormulasListState createState() => _FormulasListState();
}

class _FormulasListState extends State<FormulasList> {


  @override
  void initState() {
    super.initState();
    widget.appState.chapterBloc.resetSearch();

  }

  @override
  void dispose() {
    widget.appState.chapterBloc.resetSearch();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final appState = AppStateProvider.of(context);

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

            title: Text(this.widget.title, style: AppFonts.h1.copyWith(
              fontWeight: FontWeight.normal,
              color: AppColors.primaryWhite
            ),),
        actions: <Widget>[
          IconButton(
              icon: BizWizIcon(
                icon: AppIcons.menu,
                width: deviceExactWidth(45, context),
              ),
              onPressed: () {})
        ],
        backgroundColor: AppColors.primaryColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(114),
          child: Container(
            width: double.infinity,
            height: 114,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 36),
                TextField(
                  onChanged: appState.chapterBloc.updateSearchQuery,
                  decoration: InputDecoration(
                    fillColor: AppColors.primaryWhite,
                    filled: true,
                    prefixIcon: Container(
                      padding: const EdgeInsets.only(
                          left: 12, top: 9, bottom: 9, right: 6),
                      child: BizWizIcon(
                        icon: AppIcons.search,
                        width: deviceExactWidth(25, context),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(9)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 11, horizontal: 20),
                    hintText: 'Search Here',
                    hintStyle: AppFonts.h3.copyWith(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: AppColors.grey,
                    ),
                  ),
                  style: AppFonts.h3.copyWith(
                    fontSize: 18,
                    color: AppColors.primaryTextColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SearchList(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final appState = AppStateProvider.of(context);
    return ValueListenableBuilder(
      valueListenable: appState.chapterBloc.chapters, 
      builder: (BuildContext context, List<Chapter> chapters, Widget child){

      if(chapters == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      
    return IconTheme(
      data: IconThemeData(
        size: 40,
        color: AppColors.primaryColor,
      ),
      child: ListView(
        padding: const EdgeInsets.only(top: 15),
        children: chapters.map((chapter){
          return Padding(padding: const EdgeInsets.symmetric(vertical: 5),child: ExpansionTile(
            leading: BizWizIcon(
              icon: BizWizIcon.fromName(widget.icon),
              width: deviceExactWidth(50, context),
            ),
            title: Text(
              chapter.name,
              style: AppFonts.h2.copyWith(
                  fontWeight: FontWeight.normal, color: AppColors.primaryColor),
            ),
            onExpansionChanged: (_){
              if(chapter.children.isEmpty) {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => FormulaScreen(  appState: appState, chapter: chapter,)));
              }
            },
            children: chapter.children.map((lesson) {
              return ListTile(
                title: Text(
                  lesson.name,
                  style: AppFonts.h3.copyWith(
                      fontSize: 20,
                      color: AppColors.blackAbs.withOpacity(0.57)),
                ),
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => FormulaScreen(appState: appState, chapter: lesson,)));
                },
              );
            }).toList(),
          ),);
        }).toList()
      ),
    );
    });
  }
}
