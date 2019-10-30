import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:servicio_upeu/models/categoriacli.dart';

class ListViewJsonapi extends StatefulWidget {
  _ListViewJsonapiState createState() => _ListViewJsonapiState();
}

class _ListViewJsonapiState extends State<ListViewJsonapi> {
  final String uri = 'http://172.22.90.32:6060/catcli/listCatCli';

  Future<List<CategoriaCliente>> _fetchUsers() async {
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<CategoriaCliente> listOfUsers = items.map<CategoriaCliente>((json) {
        return CategoriaCliente.fromJson(json);
      }).toList();

      return listOfUsers;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<CategoriaCliente>>(
        future: _fetchUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView(
            padding: EdgeInsets.only(top: 60),
            children: snapshot.data
                .map((user) => ListTile(
                      title: Text(user.nombreC),
                      subtitle: Text(user.descripcionC),
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text(user.nombreC[0],
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            )),
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}