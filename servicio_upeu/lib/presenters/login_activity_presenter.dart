import 'package:servicio_upeu/models/user.dart';
import 'package:servicio_upeu/interactor/login_activity_contract.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:servicio_upeu/webservices/api_service.dart';
import 'package:dio/dio.dart';
import 'package:servicio_upeu/models/persona.dart';

class LoginActivityPresenter implements LoginActivityInteractor {
  LoginActivityView view;
  LoginActivityPresenter(this.view);
  RestClient api = RestClient(Dio());

  @override
  void success(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("api_token", token);
    await prefs.setString("nombre_user", token);
  }

  @override
  void destroy() => view = null;

  @override
  void login(String email, String password) async {
    await api.loginR(email, password).then((it) {
        Persona u = Persona.fromJson(it.data);
        this.success(u.nombres);
        view?.finish();
    }).catchError((e) {
      print("Exception $e");
      view?.toast("Inicio de sesion fallido, verifique su usuario y clave");
    });
  }
}
