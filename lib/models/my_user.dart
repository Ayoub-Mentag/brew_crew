class MyUser {
  final String? uid;

  MyUser({ this.uid });
}


class UserData {
  String uid;
  String name;
  String sugars;
  int strength;

  UserData({required this.uid, required this.name, required this.sugars, required this.strength});
}