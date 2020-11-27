import 'dart:async';

import 'package:inventario_alv/models/companies/company.dart';
import 'package:inventario_alv/models/articles/computer.dart';
import 'package:inventario_alv/models/articles/keyboard.dart';
import 'package:inventario_alv/models/articles/monitor.dart';
import 'package:inventario_alv/models/articles/articles.dart';
import 'package:inventario_alv/services/articles.dart';
export 'package:inventario_alv/models/companies/company.dart';
import 'package:inventario_alv/services/company.dart';

final companyServices = ServiceCompanies();

List<Company> companies;
List<BranchOffice> branch_offices;
Articles articles;

class CompanyBloc {
  final _companyController = StreamController<List<Company>>.broadcast();

  Stream<List<Company>> get streamCompany => _companyController.stream;

  cargarCompany() async {
    companies = await companyServices.getCompanies();
    _companyController.sink.add(companies);
  }

  dispose() {
    _companyController.close();
  }
}

class Branch_OfficesBloc {
  final _branchofficesController =
      StreamController<List<BranchOffice>>.broadcast();

  Stream<List<BranchOffice>> get streamBranchOffice =>
      _branchofficesController.stream;

  void cargarBranch_Offices() async {
    for (var company in companies) {
      await _branchofficesController.sink.add(company.branchOffices);
    }
  }

  dispose() {
    _branchofficesController.close();
  }
}

class ArticlesBloc {
  final _articlesController = StreamController<Articles>.broadcast();

  final _computerController = StreamController<List<Computer>>.broadcast();
  final _monitorController = StreamController<List<Monitor>>.broadcast();
  final _keyboardController = StreamController<List<Keyboard>>.broadcast();

  Stream<List<Computer>> get streamComputer => _computerController.stream;
  Stream<List<Monitor>> get streamMonitor => _monitorController.stream;
  Stream<List<Keyboard>> get streamKeyboard => _keyboardController.stream;
  Stream<Articles> get streamArticles => _articlesController.stream;

  cargarArticles() async {
    // _computerController.sink.add(articles.computer);
    // _monitorController.sink.add(articles.monitor);
    // _keyboardController.sink.add(articles.keyboard);
  }

  dispose() {
    _computerController.close();
    _monitorController.close();
    _keyboardController.close();
  }
}
