import 'package:formulas_cms/models/models.dart';
import 'package:http/http.dart' as http;

const String kHostName = '127.0.0.1:8080';

class BaseActions {
  Future<http.Response> apiRequest(HttpRequest request, String uriPath,
      dynamic body, Map<String, String> query) async {
    http.Response resp;

    var headers = {
      'content-type': 'application/json'
    };
    try {
      switch (request) {
        case HttpRequest.GET:
          resp = await http.get(_getUri(uriPath, query), headers: headers);
          break;
        case HttpRequest.POST:
          resp = await http.post(_getUri(uriPath, query),headers: headers, body: body);
          break;
        case HttpRequest.DELETE:
          resp = await http.get(_getUri(uriPath, query), headers: headers);
          break;
        default:
      }
    } catch (e) {
      return http.Response('', 400);
    }

    if (resp.statusCode != 200) {
      return http.Response('', resp.statusCode);
    }
    return resp;
  }

  Uri _getUri(String path, Map<String, String> query) {
    return Uri.http(kHostName, '/api' + path, query);
  }
}
