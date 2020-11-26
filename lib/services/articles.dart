import 'dart:convert';
import 'package:inventario_alv/models/articles.dart';

class ServiceArticles {
  final String url = "http://10.0.0.80:3000/api/v1";

  // Future<dynamic> getArticlesByCompany(String rnc) async {
  //   final resp = await http.get("$url/company/$rnc/articles");
  //   final body = jsonDecode(resp.body);
  //   return listArticles(body["data"]);
  // }
}
