class Student {
  String id;
  String name;
  String email;
  num n1;
  num n2;

  Student(
      {required this.id,
      required this.name,
      required this.email,
      required this.n1,
      required this.n2});

  String toString() =>
      "Id: $id, Name: $name, email: $email, Nota 1: $n1, Nota 2: $n2";
}
