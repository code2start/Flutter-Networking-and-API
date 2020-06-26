import 'package:flutter/material.dart';
import 'package:networking/model/author.dart';
import 'package:networking/network/api.dart';
import 'package:networking/ui/update_author.dart';

import 'add_author.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Author>> authors;
  @override
  void initState() {
    super.initState();
    setState(() {
      authors = API.getAllAuthors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Networking lesson 2'),
      ),
      body: Center(
        child: FutureBuilder<List<Author>>(
          future: authors,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return Dismissible(
                      key: ObjectKey(snapshot.data[i].id),
                      onDismissed: (direction) {
                        //print(direction.index);
                        API.deleteAuthor(snapshot.data[i].id);
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                              '${snapshot.data[i].id} - ${snapshot.data[i].name}'),
                          subtitle: Row(
                            children: <Widget>[
                              Text(snapshot.data[i].bio),
                              SizedBox(
                                width: 50,
                              ),
                              Text('${snapshot.data[i].age}'),
                            ],
                          ),
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UpdateAuthor(snapshot.data[i]),
                              ),
                            );
                            setState(() {
                              authors = API.getAllAuthors();
                            });
                          },
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('Sorry there is an error');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAuthor(),
            ),
          );
          setState(() {
            authors = API.getAllAuthors();
          });
        },
      ),
    );
  }
}
