part of 'api_categorcli.dart';

@RestApi(baseUrl: url_base)
class _RestCategorCli implements RestCategorCli {
  _RestCategorCli(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
    _dio.options.baseUrl = url_base;
  }
  final String uri = url_base + 'catcli/listCatCli';
  final Dio _dio;

  @override
  listCategorCli() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        '/catcli/listCatCli',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: uri),
        data: _data);
    var value = _result.data
        .map(
            (dynamic i) => CategoriaCliente.fromJson(i as Map<String, dynamic>))
        .toList();    
    print(value.length);
    return Future.value(value);
  }

  Future<List<CategoriaCliente>> listCategorCli2() async {
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<CategoriaCliente> listOfUsers = items.map<CategoriaCliente>((json) {
        return CategoriaCliente.fromJson(json);
      }).toList();

      return listOfUsers;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  @override
  getCategorCliId(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/tasks/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: uri),
        data: _data);
    final value = CategoriaCliente.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  updateCategorCliPart(id, map) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(map, 'map');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/tasks/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: uri),
        data: _data);
    final value = CategoriaCliente.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  updateCategorCli(id, task) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/tasks/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: uri),
        data: _data);
    final value = CategoriaCliente.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  deleteCategorCli(id) async {
    ArgumentError.checkNotNull(id, "0");
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/catcli/catcli/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: uri),
        data: _data);
    return Future.value(null);
  }

  @override
  createCategorCli(task) async {
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/catcli/catcli',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: uri),
        data: _data);
    final value = CategoriaCliente.fromJson(_result.data);
    return Future.value(value);
  }

  /*@override
  createNewCategorCliFromFile(file) async {
    ArgumentError.checkNotNull(file, 'file');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData.from(<String, dynamic>{
      'file': MultipartFile.fromFileSync(file.path,
          filename: file.path.split(Platform.pathSeparator).last)
    });
    await _dio.request<void>('http://httpbin.org/post',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: uri),
        data: _data);
    return Future.value(null);
  }*/
}
