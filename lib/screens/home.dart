import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formulas_cms/blocs/blocs.dart';
import 'package:formulas_cms/models/models.dart';
import 'package:formulas_cms/screens/formulas_list.dart';
import 'package:formulas_cms/utils/app_icons.dart';
import 'package:formulas_cms/utils/colors.dart';
import 'package:formulas_cms/utils/fonts.dart';
import 'package:formulas_cms/utils/utils.dart';
import 'package:formulas_cms/widgets/search_list.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final appState = AppStateProvider.of(context);

    return ValueListenableBuilder(
        valueListenable: appState.courseBloc.courses,
        builder: (BuildContext context, List<Course> courses, Widget child) {
          if (courses == null) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: BizWizIcon(
                    icon: AppIcons.drawer,
                    width: deviceExactWidth(45, context),
                  ),
                  onPressed: () {}),
              actions: <Widget>[
                IconButton(
                    icon: BizWizIcon(
                      icon: AppIcons.notification,
                      width: deviceExactWidth(45, context),
                    ),
                    onPressed: () {})
              ],
              backgroundColor: AppColors.primaryColor,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(170),
                child: Container(
                  width: double.infinity,
                  height: 170,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 36),
                      Text(
                        'WELCOME',
                        style: AppFonts.h2.copyWith(
                            color: AppColors.primaryWhite,
                            fontStyle: FontStyle.italic,
                            fontSize: 20),
                      ),
                      SizedBox(height: 6),
                      Text(
                        ' What do you want to learn today?',
                        style: AppFonts.h2.copyWith(
                          color: AppColors.primaryWhite,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 15),
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
              child: _buildCourses(appState, courses),
            ),
          );
        });
  }

  Widget _buildCourses(AppState appState, List<Course> courses) {
    return ListView(
      padding: const EdgeInsets.only(top: 10),
      children: courses.map((course) {
        return _buildCourse(BizWizIcon.fromName(course.icon), course.name, onTap: () {
          appState.chapterBloc.getChapters(course.id);
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (_) => FormulasList(
                        icon: course.icon,
                        title: course.name,
                        appState: appState,
                      )));
        });
      }).toList(),
    );
  }

  InkWell _buildCourse(AppIcons icon, String name, {VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: deviceExactWidth(55, context), vertical: 35),
        child: Row(
          children: <Widget>[
            BizWizIcon(
              icon: icon,
              width: deviceExactWidth(50, context),
            ),
            SizedBox(width: deviceExactWidth(35, context)),
            Text(
              name,
              style: AppFonts.h1.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                color: AppColors.scorpion,
              ),
            )
          ],
        ),
      ),
    );
  }
}
