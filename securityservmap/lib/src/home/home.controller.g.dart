// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$apiVersionResponseAtom =
      Atom(name: '_HomeControllerBase.apiVersionResponse');

  @override
  String get apiVersionResponse {
    _$apiVersionResponseAtom.reportRead();
    return super.apiVersionResponse;
  }

  @override
  set apiVersionResponse(String value) {
    _$apiVersionResponseAtom.reportWrite(value, super.apiVersionResponse, () {
      super.apiVersionResponse = value;
    });
  }

  final _$entitiesResponseAtom =
      Atom(name: '_HomeControllerBase.entitiesResponse');

  @override
  String get entitiesResponse {
    _$entitiesResponseAtom.reportRead();
    return super.entitiesResponse;
  }

  @override
  set entitiesResponse(String value) {
    _$entitiesResponseAtom.reportWrite(value, super.entitiesResponse, () {
      super.entitiesResponse = value;
    });
  }

  final _$ocorrenciasAtom = Atom(name: '_HomeControllerBase.ocorrencias');

  @override
  ObservableList<OcorrenciaModel> get ocorrencias {
    _$ocorrenciasAtom.reportRead();
    return super.ocorrencias;
  }

  @override
  set ocorrencias(ObservableList<OcorrenciaModel> value) {
    _$ocorrenciasAtom.reportWrite(value, super.ocorrencias, () {
      super.ocorrencias = value;
    });
  }

  @override
  String toString() {
    return '''
apiVersionResponse: ${apiVersionResponse},
entitiesResponse: ${entitiesResponse},
ocorrencias: ${ocorrencias}
    ''';
  }
}
