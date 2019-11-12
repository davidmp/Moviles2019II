import 'package:flutter/material.dart';
import 'package:servicio_upeu/interactor/categorcliente_activity_contract.dart';
import 'package:servicio_upeu/models/categoriacli.dart';
import 'package:servicio_upeu/presenters/categorcliente_activity_presenter.dart';
import 'package:servicio_upeu/views/theme/appTheme.dart';
import 'package:toast/toast.dart';

class ListViewJsonapi extends StatefulWidget {
  _ListViewJsonapiState createState() => _ListViewJsonapiState();
}

class _ListViewJsonapiState extends State<ListViewJsonapi>
    implements CategorClienteActivityView {
  CategorClienteActivityPresenter presenter;
  //var lista;
  static Future<List<CategoriaCliente>> lista;
  @override
  void initState() {
    presenter = CategorClienteActivityPresenter(this);
    super.initState();
    setState(() {
      lista = presenter.listCatgorCli();
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    FutureBuilder<List<CategoriaCliente>>(
      future: lista,
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
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.grey.withOpacity(0.2),
        title: Text("Lista de Categoria Cliente"),
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void toast(String message) => Toast.show(message, context,
      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
}
