import 'package:servicio_upeu/models/model_ultis/data_typeuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:servicio_upeu/interactor/login_activity_contract.dart';
import 'package:servicio_upeu/presenters/login_activity_presenter.dart';
import 'package:toast/toast.dart';
//import 'package:calidad_serv/views/register_act.dart';
import 'package:servicio_upeu/views/app_home.dart';
import 'package:servicio_upeu/views/drawer/navigationHomeScreen.dart';

class EvaluationActivity extends StatefulWidget {
  final DataTypeUser datos;
  EvaluationActivity({Key key, @required this.datos}) : super(key: key);

  @override
  _EvalActivityState createState() => _EvalActivityState(datos: datos);
}

class _EvalActivityState extends State<EvaluationActivity>
    implements LoginActivityView {
  LoginActivityPresenter presenter;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final DataTypeUser datos;

  _EvalActivityState({Key key1, @required this.datos});

  @override
  void initState() {
    super.initState();
    presenter = LoginActivityPresenter(this);
  }

  void doLogin(String email, String password) {
    if (password.length < 5) {
      toast("La contraseña contiene al menos 8 caracteres.");
      return;
    }
    presenter.login(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 60.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                            "Sistema de Monitoreo de calidad de Atención: ${datos.typeUser} - ${datos.dataQR}",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 28.0,
                                fontWeight: FontWeight.w600))
                      ],
                    )),
                new Row(
                  children: <Widget>[
                    Expanded(
                      child: new Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 30.0),
                        child: Text(
                          "Usuario:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                new Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.redAccent,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                        child: TextField(
                          controller: emailController,
                          obscureText: false,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'yudhanewbie@gmail.com',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24.0,
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: new Text(
                          "Clave:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                new Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.redAccent,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '*********',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24.0,
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    doLogin(emailController.text.trim(),
                        passwordController.text.trim());
                  },
                  child: Text("Ingresar"),
                ),
                MaterialButton(
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavigationHomeScreen()))
                  },
                  child: Text("Home"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void finish() => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => NavigationHomeScreen()));

  @override
  void toast(String message) => Toast.show(message, context,
      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

  @override
  sucsseslogin(String data) async {}
}
