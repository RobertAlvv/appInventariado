import 'dart:convert';

List<Users> listUsers(List<dynamic> data) {
  List<Users> users = [];
  for (var item in data) {
    users.add(Users.fromJson(item));
  }
  return users;
}

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.id,
    this.username,
    this.password,
    this.tokenJwt,
  });

  int id;
  String username;
  String password;
  String tokenJwt;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
        tokenJwt: json["token_jwt"] == null ? null : json["token_jwt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "username": username == null ? null : username,
        "password": password == null ? null : password,
        "token_jwt": tokenJwt == null ? null : tokenJwt,
      };
}
