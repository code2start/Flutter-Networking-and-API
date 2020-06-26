import 'package:flutter/material.dart';
import 'package:networking/model/author.dart';
import 'package:networking/network/api.dart';

class UpdateAuthor extends StatefulWidget {
  UpdateAuthor(this.author);
  final Author author;
  @override
  _UpdateAuthorState createState() => _UpdateAuthorState();
}

class _UpdateAuthorState extends State<UpdateAuthor> {
  String name;
  String bio;
  int age;

  @override
  void initState() {
    super.initState();
    setState(() {
      name = widget.author.name;
      bio = widget.author.bio;
      age = widget.author.age;
    });
  }

  final updateAuthor = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: updateAuthor,
      appBar: AppBar(
        title: Text('Update Author'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Author Name',
                  hintText: name,
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      name = value;
                    }
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Author bio',
                  hintText: bio,
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      bio = value;
                    }
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Author age',
                  hintText: '$age',
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      age = int.parse(value);
                    }
                  });
                },
              ),
              RaisedButton(
                child: Text('Save'),
                onPressed: () {
                  //send data to the internet (aqueduct server)
                  widget.author.name = name;
                  widget.author.bio = bio;
                  widget.author.age = age;
                  API.updateAuthor(widget.author).then((author) {
                    //show snackbar
                    updateAuthor.currentState.showSnackBar(SnackBar(
                        content: Text(
                            'the author with id ${widget.author.id} has been updated')));
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
