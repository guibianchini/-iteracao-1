enum UserDesc { Student, Admin, Error }

class UserType {
  bool cond;
  UserDesc usertype;

  UserType({
    required this.cond,
    required this.usertype,
  });
}
