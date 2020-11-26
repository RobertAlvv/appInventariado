import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:inventario_alv/models/company.dart';
import 'package:inventario_alv/services/response.dart';

class ServiceCompany {
  final String url = "http://10.0.0.80:3000/api/v1";
  Dio dio = Dio();

  Future<List<Company>> getCompanies() async {
    try {
      Response resp = await dio.get(
        "$url/companies",
        options: Options(headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNjA2NDIzNzQ2LCJzdWIiOiJcciJ9.dXrRXkCThSCjKfs47GdcEx9BGBfk5FySOkY9tK2WaHw"
        }),
      );
      return [];
    } catch (e) {
      ResponseError error = ResponseError();
      String errorStatus = error.status(e.toString());
      print(errorStatus);
      print(e);
      return <Company>[Company(businessName: errorStatus)];
    }
  }

  // Future<Company> getCompany(String rnc) async {
  //   final resp = await http.get("$url/company/$rnc");
  //   Company company = companyFromJson(resp.body);
  //   return company;
  // }
}
