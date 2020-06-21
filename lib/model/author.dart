class Author {
  int id;
  String name;
  int age;
  String bio;
  Author({this.id, this.name, this.age, this.bio});
  factory Author.fromJson(Map<String, dynamic> author) => Author(
      id: author['id'],
      name: author['name'],
      age: author['age'],
      bio: author['bio']);

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "bio": bio, "age": age};
}
