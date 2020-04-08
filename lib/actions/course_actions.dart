
import 'package:formulas_cms/actions/actions.dart';
import 'package:formulas_cms/models/api_response.dart';
import 'package:formulas_cms/models/models.dart';

class CourseAction {
  Future<List<Course>> getCourse() async {
    var resp = await BaseActions().apiRequest(HttpRequest.GET, '/course', null, null);
    var apiResponse = ApiResponse.fromJson(resp.body);

    if(apiResponse.hasData){
      return (apiResponse.data as List).map((s) => Course.fromJson(s)).toList();
    }
    return null;
  }
}