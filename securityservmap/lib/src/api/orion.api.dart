import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:securityservmap/src/api/models/ocorrencia.model.dart';
import 'package:mobx/mobx.dart';

// import 'package:intl/date_symbols.dart';
import 'package:securityservmap/src/home/home.controller.dart';

class OrionApi {
  static const String _baseURL = 'http://localhost:8080';
  static const String _versionUrl = _baseURL + '/version';
  static const String _entitiesUrl = _baseURL + '/entities';
  static const String _assaltosUrl = _baseURL + '/assaltos';
  static const String _homicidiosUrl = _baseURL + '/homicidios';
  static const String _ocorrenciasUrl = _baseURL + '/ocorrencias';
  static const String _roubosDeCarros = _baseURL + '/roubosDeCarros';

  static void _printResponse(Response r) {
    print('RESPOSE: ${r.statusCode}');
    print('RESPOSE: ${r.statusMessage}');
    print('RESPOSE: ${r.data}');
  }

  static void _printRequest(String str) {
    print('REQUEST: $str');
  }

  static Future<void> getVersion() async {
    try {
      _printRequest(_versionUrl);
      var r = await Dio().get(_versionUrl);
      _printResponse(r);
      GetIt.I.get<HomeController>().apiVersionResponse = r.data.toString();
    } catch (e) {
      print(e);
      // GetIt.I.get<HomeController>().apiVersionResponse = e.toString();
    }
  }

  static Future<void> getEntities() async {
    try {
      _printRequest(_entitiesUrl);
      var r = await Dio().get(_entitiesUrl);
      _printResponse(r);
      GetIt.I.get<HomeController>().entitiesResponse = r.data.toString();
    } catch (e) {
      print(e);
      // GetIt.I.get<HomeController>().entitiesResponse = e.toString();
    }
  }

  static Future<void> getAssaltos() async {
    try {
      // _printRequest(_assaltosUrl);
      var r = await Dio().get(_assaltosUrl);
      // _printResponse(r);

      List<OcorrenciaModel> ocorrencias = (r.data as List<dynamic>)
          .map((o) => OcorrenciaModel.fromJson(o as Map<String, dynamic>))
          .toList();
      print(ocorrencias.first);
      GetIt.I.get<HomeController>().ocorrencias = ocorrencias.asObservable();
    } catch (e) {
      print(e);
    }
  }

  static Future<void> getHomicidios() async {
    try {
      // _printRequest(_assaltosUrl);
      var r = await Dio().get(_homicidiosUrl);
      // _printResponse(r);

      List<OcorrenciaModel> ocorrencias = (r.data as List<dynamic>)
          .map((o) => OcorrenciaModel.fromJson(o as Map<String, dynamic>))
          .toList();
      print(ocorrencias.first);
      GetIt.I.get<HomeController>().ocorrencias = ocorrencias.asObservable();
    } catch (e) {
      print(e);
    }
  }

  static Future<void> getRoubosDeCarros() async {
    try {
      // _printRequest(_assaltosUrl);
      var r = await Dio().get(_roubosDeCarros);
      // _printResponse(r);

      List<OcorrenciaModel> ocorrencias = (r.data as List<dynamic>)
          .map((o) => OcorrenciaModel.fromJson(o as Map<String, dynamic>))
          .toList();
      print(ocorrencias.first);
      GetIt.I.get<HomeController>().ocorrencias = ocorrencias.asObservable();
    } catch (e) {
      print(e);
    }
  }

  static Future<void> getOcorrencias() async {
    try {
      // _printRequest(_assaltosUrl);
      var r = await Dio().get(_ocorrenciasUrl);
      // _printResponse(r);

      List<OcorrenciaModel> ocorrencias = (r.data as List<dynamic>)
          .map((o) => OcorrenciaModel.fromJson(o as Map<String, dynamic>))
          .toList();
      print(ocorrencias.first);
      GetIt.I.get<HomeController>().ocorrencias = ocorrencias.asObservable();
    } catch (e) {
      print(e);
    }
  }
}
