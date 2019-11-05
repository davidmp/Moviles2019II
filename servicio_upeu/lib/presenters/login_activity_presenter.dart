import 'package:servicio_upeu/interactor/login_activity_contract.dart';

import 'package:servicio_upeu/webservices/api_service.dart';
import 'package:dio/dio.dart';
import 'package:servicio_upeu/models/persona.dart';

class LoginActivityPresenter implements LoginActivityInteractor {
  LoginActivityView view;
  LoginActivityPresenter(this.view);
  RestClient api = RestClient(Dio());

  @override
  void destroy() => view = null;

  @override
  void login(String email, String password) async {
    await api.loginR(email, password).then((it) {
      Persona u = Persona.fromJson(it.data);
      String temp = it.data.toString();
      view?.sucsseslogin(u.nombres);
      view?.toast("Resultado: $temp");
      view?.finish();
    }).catchError((e) {
      print("Exception $e");
      view?.toast("Inicio de sesion fallido, verifique su usuario y clave");
    });
  }
}
