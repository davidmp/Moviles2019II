import 'package:flutter/material.dart';
import 'package:servicio_upeu/interactor/categorcliente_activity_contract.dart';
import 'package:servicio_upeu/models/categoriacli.dart';
import 'package:servicio_upeu/presenters/categorcliente_activity_presenter.dart';
import 'package:toast/toast.dart';

class ListViewJsonapi extends StatefulWidget {
  _ListViewJsonapiState createState() => _ListViewJsonapiState();
}

class _ListViewJsonapiState extends State<ListViewJsonapi>
    implements CategorClienteActivityView {
  CategorClienteActivityPresenter presenter;
  Future<List<CategoriaCliente>> lista;
  @override
  void initState() {
    presenter = CategorClienteActivityPresenter(this);
    setState(() {
      lista = presenter.listCatgorCli();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Categoria Cliente"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: () {}),
          new IconButton(icon: new Icon(Icons.more_vert), onPressed: () {})
        ],
      ),
      body: FutureBuilder<List<CategoriaCliente>>(
        future: lista,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

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

  @override
  void toast(String message) => Toast.show(message, context,
      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
}
