import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:securityservmap/src/api/models/ocorrencia.model.dart';

class OcorrenciaMarker extends Marker {
  OcorrenciaMarker(this.ocorrencia)
      : super(
          anchorPos: AnchorPos.align(AnchorAlign.top),
          height: 40,
          width: 40,
          point: ocorrencia.location,
          builder: (_) => Icon(
            Icons.location_on,
            size: 40,
            color: markerColor(ocorrencia.subtype),
          ),
        );

  final OcorrenciaModel ocorrencia;

  static Color markerColor(String ocorrenciaType) {
    if (ocorrenciaType == OcorrenciaSubtypeStrings.assalto) {
      return Colors.red;
    } else if (ocorrenciaType == OcorrenciaSubtypeStrings.homicidio) {
      return Colors.black;
    }
    // ocorrenciaType == OcorrenciaSubtypeStrings.rouboDeCarro
    return Colors.purple;
  }
}

class UserMarker extends Marker {
  UserMarker()
      : super(
          point: LatLng(-5.79448, -35.211),
          width: 50,
          height: 50,
          builder: (_) => Icon(
            Icons.location_on,
            size: 50,
            color: Colors.blue,
          ),
          anchorPos: AnchorPos.align(AnchorAlign.top),
        );

  final String text = 'Estou aqui';
}
