import 'package:flutter/material.dart';
import 'package:inventario_alv/bloc/company-branchOffices_bloc.dart';

class CompaniesPage extends StatelessWidget {
  final companyBloc = CompanyBloc();
  

  @override
  Widget build(BuildContext context) {
    companyBloc.cargarCompany();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Inventario App'),
      ),
      body: StreamBuilder(
        stream: companyBloc.streamCompany,
        builder: (BuildContext context, AsyncSnapshot<List<Company>> snapshot) {
          final data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${data[index].businessName}'),
                  onTap: () => Navigator.pushNamed(
                                      context, "companies-branchOffices",
                                      arguments: {
                                        "business_name": data[index].businessName,
                                        "branch_offices": data[index].branchOffices,
                                      }
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
