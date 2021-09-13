import 'package:latlong2/latlong.dart';

class OcorrenciaSubtypeStrings {
  static const String assalto = 'Assalto';
  static const String homicidio = 'Homicidio';
  static const String rouboDeCarro = 'Roubo de Carro';
}

class OcorrenciaModel {
  final String subtype;
  final String description;
  final String time;
  final LatLng location;

  @override
  String toString() {
    return '''
    subtype: $subtype;
    description: $description;
    time: $time;
    location: $location;
    ''';
  }

  static OcorrenciaModel fromJson(Map<String, dynamic> json) {
    final List<double> latlong =
        (json['location']['value']['coordinates'] as List<dynamic>)
            .map((e) => e as double)
            .toList();

    // print('BORAAAAAAAAAAAA');
    // json.forEach((key, value) => print('$key: ${value.runtimeType}'));

    return OcorrenciaModel(
      description: json['description']['value'] as String,
      location: LatLng(latlong[0], latlong[1]),
      subtype: json['subtype']['value'] as String,
      time: json['time']['value'] as String,
    );
  }

  OcorrenciaModel({
    this.subtype,
    this.time,
    this.location,
    this.description,
  });
}
