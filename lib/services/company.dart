import 'package:dio/dio.dart';
import 'package:inventario_alv/models/companies/company.dart';
import 'package:inventario_alv/services/request.dart';
import 'package:inventario_alv/services/users.dart';

class ServiceCompanies {
  RequestBase request;

  ServiceCompanies() {
    request = RequestBase();
  }

  Future<List<Company>> getCompanies() async {
    Response resp = await request.requestGet("/companies");
    final body = resp.data;
    return listCompany(body["data"]);
  }

  Future<Company> getCompany(String rnc) async {
    Response resp = await request.requestGet("/companies/$rnc");
    Company company = companyFromJson(resp.data);
    return company;
  }
}
