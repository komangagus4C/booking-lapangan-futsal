import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/dto/news.dart';
import 'package:my_app/endpoints/endpoints.dart';

class Dataservice{
  static Future<List<News>> fetchNews() async{
    final response = await http.get(Uri.parse(Endpoint.news));
    if (response.statusCode == 200){
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => News.fromJson(item)).toList();
    }else{
      throw Exception('Failed to load news');
      }
    }
    static Future<void> postEvent(String title, String body) async {
    Map<String, String> input = {
      "title": title,
      "body": body,
    };
    String dataJson = jsonEncode(input);
    await http.post(
      Uri.parse(Endpoint.news),
      body: dataJson,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
  }