import 'package:flutter/material.dart';
import 'package:networking/network/author_service.dart';

class AddAuthor extends StatefulWidget {
  @override
  _AddAuthorState createState() => _AddAuthorState();
}

class _AddAuthorState extends State<AddAuthor> {
  String name, bio;
  int age;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Author'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Author name'),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Author bio'),
              maxLines: 5,
              onChanged: (value) {
                setState(() {
                  bio = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Author age'),
              onChanged: (value) {
                setState(() {
                  age = int.parse(value);
                });
              },
            ),
            RaisedButton(
              child: Text('Add'),
              onPressed: () {
                var author = {'name': name, 'age': age, 'bio': bio};
                AuthorService.create()..createAuthor(author);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
