import 'package:servicio_upeu/interactor/categorcliente_activity_contract.dart';
import 'package:servicio_upeu/models/categoriacli.dart';
import 'package:servicio_upeu/webservices/api_categorcli.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class CategorClienteActivityPresenter
    implements CategorClienteActivityInteractor {
  CategorClienteActivityView view;
  CategorClienteActivityPresenter(this.view);
  RestCategorCli api = RestCategorCli(Dio());

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('api_token') ?? "undefined");
    return token;
  }

  @override
  Future<List<CategoriaCliente>> listCatgorCli() async {
    return await api.listCategorCli();
  }

  @override
  Future<List<CategoriaCliente>> listCatgorCli2() async {
    return await api.listCategorCli2();
  }

  @override
  Future<CategoriaCliente> saveCategorCli(CategoriaCliente modelo) async {
    return await api.createCategorCli(modelo);
  }

  @override
  Future<void> eliminarCategorCli(int id) async {
    return await api.deleteCategorCli(id);
  }

  @override
  void destroy() => view = null;
}
