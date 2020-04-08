
import 'package:formulas_cms/actions/actions.dart';
import 'package:formulas_cms/models/api_response.dart';
import 'package:formulas_cms/models/models.dart';

class ChapterAction {
  Future<List<Chapter>> getChapters(String courseId) async {
    var resp = await BaseActions().apiRequest(HttpRequest.GET, '/chapter/course/$courseId', null, null);
    var apiResponse = ApiResponse.fromJson(resp.body);

    if(apiResponse.hasData){
      return (apiResponse.data as List).map((s) => Chapter.fromJson(s)).toList();
    }
    return null;
  }

    Future<List<Chapter>> search(String query) async {
    var resp = await BaseActions().apiRequest(HttpRequest.GET, '/search', null, {'q': query});
    var apiResponse = ApiResponse.fromJson(resp.body);

    if(apiResponse.hasData){
      return (apiResponse.data as List).map((s) => Chapter.fromJson(s)).toList();
    }
    return null;
  }
  
}