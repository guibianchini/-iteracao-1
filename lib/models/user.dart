class Student {
  final String id;
  final String name;
  final String email;

  Student({
    required this.id,
    required this.name,
    required this.email,
  });

  String toString() => "Id: $id, Name: $name, email: $email";
}
