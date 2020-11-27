import 'dart:convert';
import '../articles/articles.dart';

List<Company> listCompany(List<dynamic> data) {
  List<Company> companies = [];
  for (var item in data) {
    companies.add(Company.fromJson(item));
  }
  return companies;
}

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
  Company({
    this.rnc,
    this.businessName,
    this.location,
    this.telephone,
    this.branchOffices,
  });

  String rnc;
  String businessName;
  String location;
  String telephone;
  List<BranchOffice> branchOffices;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        rnc: json["rnc"],
        businessName: json["business_name"],
        location: json["location"],
        telephone: json["telephone"],
        branchOffices: List<BranchOffice>.from(
            json["branch_offices"].map((x) => BranchOffice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rnc": rnc,
        "business_name": businessName,
        "location": location,
        "telephone": telephone,
        "branch_offices":
            List<dynamic>.from(branchOffices.map((x) => x.toJson())),
      };
}

class BranchOffice {
  BranchOffice({
    this.id,
    this.name,
    this.location,
    this.telephone,
    this.articles,
  });

  int id;
  String name;
  String location;
  String telephone;
  Articles articles;

  factory BranchOffice.fromJson(Map<String, dynamic> json) => BranchOffice(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        telephone: json["telephone"],
        articles: listArticles(json["articles"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "telephone": telephone,
        "articles": articles,
      };
}
