import 'package:flutter/material.dart';
import 'package:servicio_upeu/interactor/categorcliente_activity_contract.dart';
import 'package:servicio_upeu/models/categoriacli.dart';
import 'package:servicio_upeu/presenters/categorcliente_activity_presenter.dart';
import 'package:servicio_upeu/views/theme/appTheme.dart';
import 'package:toast/toast.dart';

class TabPage1 extends StatefulWidget {
  TabPage1({Key key, this.data}) : super(key: key);

  // TabPage1({ Key key , this.data}) : super(key: key)

  final String data;

  @override
  _MyTabPageState createState() => new _MyTabPageState();
}

class _MyTabPageState extends State<TabPage1>
    implements CategorClienteActivityView {
  CategorClienteActivityPresenter presenter;
  Future<List<CategoriaCliente>> listaxx;

  @override
  void initState() {
    presenter = CategorClienteActivityPresenter(this);
    super.initState();
    setState(() {
      listaxx = presenter.listCatgorCli();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.grey.withOpacity(0.2),
        title: Text("Lista:" + widget.data),
        centerTitle: true,
        elevation: 0.1,
        leading: Padding(
          padding: EdgeInsets.only(left: 5.0),
          //child: Icon(Icons.menu),
        ),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: () {}),
          new IconButton(icon: new Icon(Icons.more_vert), onPressed: () {})
        ],
      ),
      body: new FutureBuilder<List<CategoriaCliente>>(
        future: listaxx,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            //padding: EdgeInsets.only(top: 60),
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
