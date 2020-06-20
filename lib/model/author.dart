class Author {
  int id;
  String name;
  Author({this.id, this.name});
  factory Author.fromJson(Map<String, dynamic> author) =>
      Author(id: author['id'], name: author['name']);
}
