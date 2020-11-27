import 'package:flutter/material.dart';
import 'package:inventario_alv/models/users/users.dart';
import 'package:inventario_alv/services/users.dart';

class LoginPage extends StatelessWidget {
  ServiceLogin userServices = ServiceLogin();
  Users user = Users(username: "robertalv25", password: "123456");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text("Next"),
          onPressed: () async {
            final value = await userServices.login(user);
            if (value) {
              Navigator.pushNamed(context, "companies");
            }
          },
        ),
      ),
    );
  }
}
