import 'package:flutter/material.dart';
import 'package:inventario_alv/bloc/company-branchOffices_bloc.dart';
import 'package:inventario_alv/models/articles.dart';

class Company_BranchOfficesPage extends StatelessWidget {
  final branch_officesBloc = Branch_OfficesBloc();

  @override
  Widget build(BuildContext context) {
    branch_officesBloc.cargarBranch_Offices();
   Map<String, dynamic> send = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(send["business_name"]),
      ),
      body: StreamBuilder(
        stream: branch_officesBloc.streamBranchOffice,
        builder:
            (BuildContext context, AsyncSnapshot<List<BranchOffice>> snapshot) {
          final data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                 Articles articles = send["branch_offices"][index].articles;
                return ListTile(
                  title: Text('${data[index].name}'),
                  onTap: () => Navigator.pushNamed(
                      context, "branchOffices-articles",
                      arguments: {
                        "articles": articles,
                      }),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
