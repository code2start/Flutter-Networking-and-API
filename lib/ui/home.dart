import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:networking/network/author_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthorService authorService;
  Future<Response> authorResponse;

  @override
  void initState() {
    super.initState();
    authorService = AuthorService.create();
    authorResponse = authorService.getAllAuthors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Authors'),
      ),
      body: Center(
        child: FutureBuilder<Response>(
          future: authorResponse,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //print(snapshot.data.bodyString);
              final List authors = json.decode(snapshot.data.bodyString);
              return ListView.builder(
                  itemCount: authors.length,
                  itemBuilder: (context, i) {
                    return Card(
                      margin: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(authors[i]['name']),
                        subtitle: Row(
                          children: <Widget>[
                            Text(authors[i]['bio']),
                            SizedBox(
                              width: 100,
                            ),
                            Text('${authors[i]['age']}'),
                          ],
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('Please try again');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
