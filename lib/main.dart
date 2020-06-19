import 'dart:convert';

import 'package:networking/model/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Post> futurePost;
  @override
  void initState() {
    super.initState();
    futurePost = getPostById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Netowrking HTTP Lesson 1'),
      ),
      body: Center(
        child: FutureBuilder<Post>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<Post> getPostById() async {
    http.Response postResponse =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');
    if (postResponse.statusCode == 200) {
      //success you can get the value
      //print(postResponse.body);
      return Post.fromJson(json.decode(postResponse.body));
    } else {
      throw Exception('Cant not load this post');
    }
  }
}
