import 'package:servicio_upeu/interactor/main_activity_contract.dart';
import 'package:servicio_upeu/models/post.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
//import 'package:calidad_serv/webservices/api_service.dart';
import 'package:flutter/material.dart';

class MainActivityPresenter implements MainActivityInteractor {
  MainActivityView view;
  MainActivityPresenter(this.view);
//  RestClient api = RestClient(Dio());

  List _tipoClientes=[
    "Estudiante",
    "Docente",
    "Padre de Familia",
    "Personal Administrativo",
    "Administrador"
    "Otros"
    ];

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('api_token') ?? "undefined");
    return token;
  }
  
  @override
  List<DropdownMenuItem<String>> getDropDownMenuItems(){
    List<DropdownMenuItem<String>> items=new List(); 
    for(String tipo in _tipoClientes){
      items.add(new DropdownMenuItem(value:tipo, child: new Text(tipo)));
    }
    return items;
  }

  @override
  Future<List<Post>> all() async {
    List<Post> posts = List();
    var token = await getToken();
    token = "Bearer $token";
    /*await api.all(token).then((it) {
      if (it.status == "1") {
        var temps = it.data;
        for (var t in temps) {
          posts.add(Post.fromJson(t));
        }
      }
    });*/
    return posts;
  }

  @override
  void destroy() => view = null;
}
