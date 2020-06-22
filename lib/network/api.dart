import 'dart:convert';

import 'package:http/http.dart';
import 'package:networking/model/author.dart';

class API {
  static const String _BASE_URL = 'http://10.0.2.2:8888';
  static Future<Author> createAuthor(Author author) async {
    //business logic to send data to server
    final Response response = await post('$_BASE_URL/authors',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(author.toJson()));

    if (response.statusCode == 200) {
      //print(response.body);
      return Author.fromJson(json.decode(response.body));
    } else {
      //print('Error');
      throw Exception("Can't load author");
    }
  }

  static Future<List<Author>> getAllAuthors() async {
    //business logic to send data to server
    final Response response = await get('$_BASE_URL/authors');

    if (response.statusCode == 200) {
      //print(response.body);
      //parse json into list of objects
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Author>((item) => Author.fromJson(item)).toList();
    } else {
      //print('Error');
      throw Exception("Can't load author");
    }
  }
}
