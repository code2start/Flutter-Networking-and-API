class Author {
  int id;
  String name;
  String bio;
  int age;
  Author({this.id, this.name, this.bio, this.age});
  factory Author.fromJson(Map<String, dynamic> author) => Author(
      id: author['id'],
      name: author['name'],
      bio: author['bio'],
      age: author['age']);
  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'bio': bio, 'age': age};
}
