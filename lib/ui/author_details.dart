import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:networking/network/author_service.dart';

class AuthorDetails extends StatefulWidget {
  AuthorDetails(this.id);
  final int id;
  @override
  _AuthorDetailsState createState() => _AuthorDetailsState();
}

class _AuthorDetailsState extends State<AuthorDetails> {
  AuthorService authorService;
  Future<Response> authorResponse;
  @override
  void initState() {
    super.initState();
    authorService = AuthorService.create();
    authorResponse = authorService.getAuthorById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Author Details'),
      ),
      body: Center(
        child: FutureBuilder<Response>(
          future: authorResponse,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //print(snapshot.data.bodyString);
              Map<String, dynamic> author =
                  json.decode(snapshot.data.bodyString);
              return Column(
                children: <Widget>[
                  Text(
                    author['name'],
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    author['bio'],
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text('age is ${author['age']}'),
                ],
              );
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
