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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                        child: Text("Pagina Principal del Sistema"))
                  ],
                )),
            Divider(
              height: 24.0,
            ),
            Divider(
              height: 24.0,
            ),
            Container(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Text("Si no tiene una cuenta, puede registrarse"),
            ),
            MaterialButton(
              color: Colors.orange,
              textColor: Colors.white,
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginActivity()))
              },
              child: Text("Home"),
            )
          ],
        ),
      ),
    );
  }

  @override
  void toast(String message) => Toast.show(message, context,
      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
}
