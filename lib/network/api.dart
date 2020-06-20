import 'dart:convert';

import 'package:http/http.dart';
import 'package:networking/model/author.dart';

class API {
  static String _BASE_URL = 'http://10.0.2.2:8888';
  static Future<Author> createAuthor(String name) async {
    final Response response = await post('$_BASE_URL/authors',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, String>{"name": name}));
    if (response.statusCode == 200) {
      //print(response.body);
      return Author.fromJson(json.decode(response.body));
    } else {
      ///print('Error');
      throw Exception("Can't load author");
    }
  }
}
