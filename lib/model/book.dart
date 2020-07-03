import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

class Book {
  int id;
  String name;
  Map author;

  Book({this.id, this.author, this.name});

  factory Book.fromJson(Map json) =>
      Book(id: json['id'], name: json['name'], author: json['author']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'author': author};
}
