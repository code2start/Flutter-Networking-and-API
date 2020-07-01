import 'package:flutter/material.dart';
import 'package:networking/network/author_service.dart';

class UpdateAuthor extends StatefulWidget {
  final Map<String, dynamic> author;
  UpdateAuthor(this.author);

  @override
  _UpdateAuthorState createState() => _UpdateAuthorState();
}

class _UpdateAuthorState extends State<UpdateAuthor> {
  String name, bio;
  int age;
  @override
  void initState() {
    super.initState();
    name = widget.author['name'];
    bio = widget.author['bio'];
    age = widget.author['age'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Author'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration:
                  InputDecoration(hintText: name, labelText: 'Author name'),
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    name = value;
                  }
                });
              },
            ),
            TextField(
              decoration:
                  InputDecoration(hintText: bio, labelText: 'Author bio'),
              maxLines: 5,
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    bio = value;
                  }
                });
              },
            ),
            TextField(
              decoration:
                  InputDecoration(hintText: '$age', labelText: 'Author age'),
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
                var author = widget.author;
                author['name'] = name;
                author['age'] = age;
                author['bio'] = bio;
                AuthorService.create()..updateAuthor(author['id'], author);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
