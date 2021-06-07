class Student {
  final String id;
  final String name;
  final String email;
  final num n1;
  final num n2;

  Student(
      {required this.id,
      required this.name,
      required this.email,
      required this.n1,
      required this.n2});

  String toString() => "Id: $id, Name: $name, email: $email";
}
