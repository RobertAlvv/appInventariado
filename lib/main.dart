import 'package:flutter/material.dart';
import 'package:inventario_alv/pages/branchOffices_articles.dart';
import 'package:inventario_alv/pages/companies.dart';
import 'package:inventario_alv/pages/company_branchOffices.dart';
import 'package:inventario_alv/pages/login.dart';

void main() => runApp(InventarioApp());

class InventarioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventario App',
      debugShowCheckedModeBanner: false,
      initialRoute: "login",
      routes: {
        "login": (BuildContext context) => LoginPage(),
        "companies": (BuildContext context) => CompaniesPage(),
        "companies-branchOffices": (BuildContext context) =>
            Company_BranchOfficesPage(),
        "branchOffices-articles": (BuildContext context) =>
            BranchOffices_ArticlesPage(),
      },
    );
  }
}
