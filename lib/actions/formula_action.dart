
import 'dart:convert';

import 'package:formulas_cms/actions/actions.dart';
import 'package:formulas_cms/models/api_response.dart';
import 'package:formulas_cms/models/models.dart';

class FormulaAction {
  Future<Formula> getFormula(String chapterId) async {
    var resp = await BaseActions().apiRequest(HttpRequest.GET, '/formula/chapter/$chapterId', null, null);
    var apiResponse = ApiResponse.fromJson(resp.body);

    if(apiResponse.hasData){
      return Formula.fromJson(apiResponse.data);
    }
    return null;
  }


  Future<bool> addFormula(Map<String, String> body) async {
    var resp = await BaseActions().apiRequest(HttpRequest.POST, '/formula', json.encode(body), null).timeout(Duration(seconds: 15));
    var apiResponse = ApiResponse.fromJson(resp.body);

    return resp.statusCode == 200 && apiResponse.hasData;
  }

   Future<bool> updateFormula(String id, Map<String, String> body) async {
    var resp = await BaseActions().apiRequest(HttpRequest.POST, '/formula/$id', json.encode(body), null).timeout(Duration(seconds: 15));
    var apiResponse = ApiResponse.fromJson(resp.body);

    return resp.statusCode == 200 && apiResponse.hasData;
  }
}