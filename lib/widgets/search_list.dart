import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formulas_cms/blocs/blocs.dart';
import 'package:formulas_cms/models/models.dart';
import 'package:formulas_cms/screens/formula_screen.dart';
import 'package:formulas_cms/utils/colors.dart';
import 'package:formulas_cms/utils/fonts.dart';


class SearchList extends StatelessWidget {

  final Widget child;

  const SearchList({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = AppStateProvider.of(context);
    return ValueListenableBuilder(valueListenable: appState.chapterBloc.searchQuery,
             builder: (BuildContext context, String searchQuery, Widget child){
               if(searchQuery.isEmpty) {
                 return child;
               }
               return ValueListenableBuilder(
                valueListenable: appState.chapterBloc.searchResults, 
                builder: (BuildContext context, List<Chapter> searchResults, Widget child){
                  if(searchResults== null) {
                    return Center(child: CircularProgressIndicator());
                  } else if(searchResults.isEmpty) {
                    return Container(
                      padding: const EdgeInsets.only(top: 15),
                      alignment: Alignment.topCenter,
                      child: Text('No results found',style: AppFonts.h2.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: AppColors.primaryTextColor
                      ),),
                    );
                  }
                  return ListView(
                    children: searchResults.map((s) {
                      return ListTile(
                        title: Text(s.name,
                          style: AppFonts.h3.copyWith(
                            color: AppColors.primaryTextColor
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context, CupertinoPageRoute(builder: (_) => FormulaScreen(appState: appState, chapter: s)));
                        },
                      );
                    }).toList(),
                  );
                });
             },
             child: this.child,
            );
  }
}