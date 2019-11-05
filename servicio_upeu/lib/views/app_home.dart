import 'package:flutter/material.dart';
import 'package:servicio_upeu/interactor/main_activity_contract.dart';
import 'package:servicio_upeu/models/categoriacli.dart';
import 'package:servicio_upeu/models/post.dart';
import 'package:servicio_upeu/presenters/main_activity_presenter.dart';

import 'package:toast/toast.dart';
import 'package:servicio_upeu/views/login_act.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:servicio_upeu/views/view_evaluation.dart';
import 'package:servicio_upeu/models/model_ultis/data_typeuser.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements MainActivityView {
  MainActivityPresenter presenter;
  List<Post> posts = new List();
  List<DropdownMenuItem<int>> _dropDownMenuItems;
  int _currentCity;
  String result = "Hey there !";
  DataTypeUser data;

  void _scanQR() async {
    Toast.show("Lectura: Holas", context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
        data = DataTypeUser(dataQR: qrResult, typeUser: _currentCity);
        Toast.show("Lectura: $result", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EvaluationActivity(datos: data),
          ),
        );
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
          Toast.show("Lectura: $result", context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
          Toast.show("Lectura: $result", context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
        Toast.show("Lectura: $result", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
        Toast.show("Lectura: $result", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      });
    }
  }

  @override
  void initState() {
    presenter = MainActivityPresenter(this);
    //_dropDownMenuItems = presenter.getDropDownMenuItems();
    //presenter.listCatgorCli2().then((data) => prueba(data));

    presenter.listCatgorCli().then((datax) => prueba(datax));
    super.initState();
  }

  void prueba(List<CategoriaCliente> data) {    
    print(data.length);
    List<DropdownMenuItem<int>> items = new List();
    for (CategoriaCliente tipo in data) {
      items.add(new DropdownMenuItem(
          value: tipo.idCategoriaCliente, child: new Text(tipo.nombreC)));
    }
    setState(() {
      _dropDownMenuItems = items;
      _currentCity = _dropDownMenuItems[0].value;
    });
  }

  void guardar() {
    presenter = MainActivityPresenter(this);
    int id = 8;
    String data = "Otros";
    CategoriaCliente ct = CategoriaCliente.all(id, data, "1", "Otros Prueba");
    /*print("Guardar Un Registro");
    presenter.saveCategorCli(ct);*/    
    presenter.eliminarCategorCli(7);    
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
                          onPressed: () =>
                              _scanQR() /*{
                          //Code to execute when Floating Action Button is clicked
                          //...
                        },*/
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
                    //guardar()
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
  void changedDropDownItem(int selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }
}
