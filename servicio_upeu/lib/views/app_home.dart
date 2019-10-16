import 'package:flutter/material.dart';
import 'package:servicio_upeu/interactor/main_activity_contract.dart';
import 'package:servicio_upeu/models/post.dart';
import 'package:servicio_upeu/presenters/main_activity_presenter.dart';
import 'package:toast/toast.dart';
import 'package:servicio_upeu/views/login_act.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements MainActivityView {
  MainActivityPresenter presenter;
  List<Post> posts = new List();
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

  @override
  void initState() {
    presenter = MainActivityPresenter(this);
    _dropDownMenuItems = presenter.getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: new Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 56.0),
                  child: Column(
                    children: <Widget>[
                      Text("SysCalidad",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600)),
                      Container(
                          padding: EdgeInsets.only(bottom: 16.0),
                          child: Text(
                              "Bienvenidos al sistema de Evaluación de Calidad de atención"))
                    ],
                  )),
              Divider(
                height: 24.0,
              ),
              Container(
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new DropdownButton(
                      value: _currentCity,
                      items: _dropDownMenuItems,
                      onChanged: changedDropDownItem,
                    ),
                    new Container(
                      padding: EdgeInsets.all(16.0),
                      child: FlatButton.icon(
                        color: Colors.transparent,
                        icon: Image.asset("assets/images/library-icon.png"),
                        label: Text(
                            'Evaluar Calidad Servicio'), //`Text` to display
                        onPressed: () {
                          //Code to execute when Floating Action Button is clicked
                          //...
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
              ),
              Container(
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: FlatButton.icon(
                  color: Colors.transparent,
                  icon: Image.asset("assets/images/iconlogin.png"),
                  label: Text('Acceder como Admin'), //`Text` to display
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginActivity()))
                  },
                ),
              ),
              Divider(
                height: 24.0,
              ),
              Container(
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: FlatButton.icon(
                  color: Colors.transparent,
                  icon: Image.asset("assets/images/mapsbutton.png"),
                  label: Text('Ubicar puntos de atención'), //`Text` to display
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginActivity()))
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void toast(String message) => Toast.show(message, context,
      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

  @override
  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }
}
