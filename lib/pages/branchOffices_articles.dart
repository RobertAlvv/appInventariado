import 'package:flutter/material.dart';
import 'package:inventario_alv/bloc/company-branchOffices_bloc.dart';
import 'package:inventario_alv/models/articles/articles.dart';

class BranchOffices_ArticlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> send = ModalRoute.of(context).settings.arguments;
    final articleBloc = ArticlesBloc();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('test'),
      ),
      body: StreamBuilder(
        stream: articleBloc.streamArticles,
        builder: (BuildContext context, AsyncSnapshot<Articles> snapshot) {
          return ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('${send["articles"].computer[index].name}'),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
