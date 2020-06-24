import 'package:flutter/material.dart';
import 'package:networking/model/author.dart';
import 'package:networking/network/api.dart';

class AddAuthor extends StatefulWidget {
  @override
  _AddAuthorState createState() => _AddAuthorState();
}

class _AddAuthorState extends State<AddAuthor> {
  String name;
  String bio;
  int age;

  final addAuthor = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: addAuthor,
      appBar: AppBar(
        title: Text('New Author'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Author Name',
                  hintText: 'Enter Author name',
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Author bio',
                  hintText: 'Enter Author bio',
                ),
                onChanged: (value) {
                  setState(() {
                    bio = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Author age',
                  hintText: 'Enter Author age',
                ),
                onChanged: (value) {
                  setState(() {
                    age = int.parse(value);
                  });
                },
              ),
              RaisedButton(
                child: Text('Save'),
                onPressed: () {
                  //send data to the internet (aqueduct server)
                  API
                      .createAuthor(Author(name: name, age: age, bio: bio))
                      .then((author) {
                    //show snackbar
                    addAuthor.currentState.showSnackBar(SnackBar(
                        content: Text(
                            'the author with id ${author.id} has been created')));
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
