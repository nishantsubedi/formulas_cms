
import 'package:formulas_cms/models/models.dart';

List<Chapter> getParentChapters() {

  List<String> separated = chaptersCsv.split('\n');
  
  var chaptersRes = separated.where((s) => s.isNotEmpty).map((str){
    var splits = str.split(',');
    return Chapter(
      courseId: splits[0],
      name: splits[1],
      description: '',
    );
  }).toList();

  List<Chapter> uniqueParentChapter = List();

  chaptersRes.forEach((chap){
    if(!uniqueParentChapter.any((c) => c.name == chap.name)) {
      uniqueParentChapter.add(chap);
    }
  });

  return uniqueParentChapter;

}

List<Chapter> getChildChapters(String parentName) {

  List<String> separated = chaptersCsv.split('\n');
  
  var chaptersRes = separated.where((s) => s.contains(parentName)).map((str){
    var splits = str.split(',');
    return Chapter(
      courseId: splits[0],
      name: splits[2],
      description: '',
    );
  }).toList();

  List<Chapter> uniqueParentChapter = List();

  chaptersRes.forEach((chap){
    if(!uniqueParentChapter.any((c) => c.name == chap.name)) {
      uniqueParentChapter.add(chap);
    }
  });

  return uniqueParentChapter;

}

String chaptersCsv = """
5e7ee5388a96706e1879011f,Mechanics,velocity
5e7ee5388a96706e1879011f,Mechanics,acceleration
5e7ee5388a96706e1879011f,Mechanics,equation of motion
5e7ee5388a96706e1879011f,Mechanics,newton's 2nd law
""";
