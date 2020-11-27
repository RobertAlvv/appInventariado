import 'package:dio/dio.dart';
import 'package:inventario_alv/models/users/users.dart';
import 'package:inventario_alv/services/request.dart';

class ServiceUsers {
  RequestBase request;
  ServiceUsers() {
    request = RequestBase();
  }

  Future<List<dynamic>> getUsers() async {
    Response resp = await request.requestGet("/users");
    final body = resp.data;
    return listUsers(body["data"]);
  }

  Future<dynamic> getUser(String id) async {
    Response resp = await request.requestGet("/users/$id");
    final body = resp.data;
    return Users.fromJson(body["data"]);
  }

  Future<dynamic> postUser(Users user) async {
    Response resp = await request.requestPost(
      "/users",
      {
        "username": user.username,
        "password": user.password,
      },
    );
    final body = resp.data;
    return Users.fromJson(body["data"]);
  }

  Future<dynamic> putUser(Users user) async {
    final resp = await request.requestPut(
      "/users/",
      user.id.toString(),
      {
        "username": user.username,
        "password": user.password,
      },
    );
    if (resp.statusCode == 200) {
      return user;
    }
    return resp.data;
  }

  Future<bool> deleteUser(Users user) async {
    final resp = await request.requestDelete("/users", user.id.toString());
    if (resp.statusCode == 200 || resp.statusCode == 204) {
      return true;
    }
    return false;
  }
}

class ServiceLogin {
  RequestBase request;

  ServiceLogin() {
    request = RequestBase();
  }

  Future<bool> login(Users user) async {
    final resp = await request.requestPost(
      "/users/login",
      {"username": user.username, "password": user.password},
    );
    if (resp.statusCode == 200) {
      user.id = resp.data["data"]["id"];
      user.tokenJwt = request.token;
      return true;
    }
    print(resp.data);
    return false;
  }
}
