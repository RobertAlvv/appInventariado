import 'dart:async';

import 'package:inventario_alv/models/company.dart';
import 'package:inventario_alv/models/computer.dart';
import 'package:inventario_alv/models/keyboard.dart';
import 'package:inventario_alv/models/monitor.dart';
import 'package:inventario_alv/models/articles.dart';
import 'package:inventario_alv/services/articles.dart';
export 'package:inventario_alv/models/company.dart';
import 'package:inventario_alv/services/company.dart';

final companyServices = ServiceCompany();

List<Company> companies;
List<BranchOffice> branch_offices;
Articles articles;

class CompanyBloc{

  final _companyController = StreamController<List<Company>>.broadcast();

  Stream<List<Company>> get streamCompany => _companyController.stream;

  cargarCompany() async{
    companies = await companyServices.getCompanies();
    _companyController.sink.add(companies);
  }

  dispose(){
    _companyController.close();
  }
}


class Branch_OfficesBloc{
  final _branchofficesController = StreamController<List<BranchOffice>>.broadcast();

  Stream<List<BranchOffice>> get streamBranchOffice => _branchofficesController.stream;
  
  cargarBranch_Offices(){
    for(var company in companies){
      branch_offices = company.branchOffices;
      print(branch_offices);
    }
    
    _branchofficesController.sink.add(branch_offices);
    
  }

  dispose(){
    _branchofficesController.close();
  }
}


class ArticlesBloc{
  final _articlesController = StreamController<Articles>.broadcast();

  final _computerController = StreamController<List<Computer>>.broadcast();
  final _monitorController = StreamController<List<Monitor>>.broadcast();
  final _keyboardController = StreamController<List<Keyboard>>.broadcast();

  Stream<List<Computer>> get streamComputer => _computerController.stream;
  Stream<List<Monitor>> get streamMonitor => _monitorController.stream;
  Stream<List<Keyboard>> get streamKeyboard => _keyboardController.stream;
  Stream<Articles> get streamArticles => _articlesController.stream;

  cargarArticles() async{
    // _computerController.sink.add(articles.computer);
    // _monitorController.sink.add(articles.monitor);
    // _keyboardController.sink.add(articles.keyboard);
  }

  dispose(){
   _computerController.close();
   _monitorController.close();
   _keyboardController.close();
  }
}