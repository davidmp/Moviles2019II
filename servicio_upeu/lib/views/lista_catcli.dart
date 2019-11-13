import 'package:flutter/material.dart';
import 'package:servicio_upeu/interactor/categorcliente_activity_contract.dart';
import 'package:servicio_upeu/models/categoriacli.dart';
import 'package:servicio_upeu/presenters/categorcliente_activity_presenter.dart';
import 'package:servicio_upeu/views/tabpage1.dart';
import 'package:servicio_upeu/views/theme/appTheme.dart';
import 'package:toast/toast.dart';

class ListViewJsonapi extends StatefulWidget {
  _ListViewJsonapiState createState() => _ListViewJsonapiState();
}

class _ListViewJsonapiState extends State<ListViewJsonapi>
    with SingleTickerProviderStateMixin
    implements CategorClienteActivityView {
  CategorClienteActivityPresenter presenter;
  //var lista;
  static Future<List<CategoriaCliente>> lista;
  TabController _tabController;
  List<CategoriaCliente> listaxx;

  final List<Tab> _bottomTabs = <Tab>[
    new Tab(text: 'home', icon: new Icon(Icons.home)),
    new Tab(text: 'Bussines', icon: new Icon(Icons.book)),
    new Tab(text: 'shool', icon: new Icon(Icons.movie)),
    //new Tab(text: 'music_video', icon: new Icon(Icons.music_video)),
  ];

  @override
  void initState() {
    presenter = CategorClienteActivityPresenter(this);
    super.initState();
    _tabController = new TabController(vsync: this, length: _bottomTabs.length);
    setState(() {
      presenter.listCatgorCli().then((datax) => prueba(datax));
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void prueba(List<CategoriaCliente> data) {
    listaxx = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
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
      ),*/
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new TabPage1(data: 'Home DMP'),
          new TabPage1(data: 'Bussines DMP'),
          new TabPage1(data: 'School DMP'),
        ],
      ),
      bottomNavigationBar: new Material(
          color: Colors.lightBlueAccent,
          child: new TabBar(
            controller: _tabController,
            tabs: _bottomTabs,
            indicatorColor: Colors.white,
          )),
    );
  }

  @override
  void toast(String message) => Toast.show(message, context,
      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
}
