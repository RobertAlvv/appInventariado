import 'package:inventario_alv/models/company.dart';
import 'package:inventario_alv/services/response.dart';

class ServiceCompany {
  RequestBase request;
  ServiceCompany() {
    request = RequestBase();
  }

  Future<List<Company>> getCompanies() async {
    var resp = await request.requestGet("/companies");
    print(resp);
    return <Company>[];
  }

  Future<Company> getCompany(String rnc) async {
    final resp = await request.requestGet("/companies/$rnc");
    Company company = companyFromJson(resp.body);
    return company;
  }
}
