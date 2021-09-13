import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:securityservmap/src/api/models/ocorrencia.model.dart';
import 'package:securityservmap/src/api/orion.api.dart';
import 'package:securityservmap/src/home/home.controller.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart";
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:securityservmap/src/ui/example_popup.widget.dart';
import 'package:securityservmap/src/ui/markers.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeController get controller => GetIt.I.get();
  final PopupController _popupLayerController = PopupController();

  List<Marker> _markers = [];

  @override
  void initState() {
    _markers = [UserMarker()];
    super.initState();
  }

  FlutterMap buildMap() {
    final LatLng natal = LatLng(-5.79448, -35.211);
    final LatLng initialPoint = natal;
    return FlutterMap(
      options: MapOptions(
        zoom: 13.0,
        center: initialPoint,
        onTap: (_) => _popupLayerController
            .hidePopup(), // Hide popup when the map is tapped.
      ),
      children: [
        TileLayerWidget(
          options: TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
        ),
        PopupMarkerLayerWidget(
          options: PopupMarkerLayerOptions(
            popupController: _popupLayerController,
            markers: _markers,
            markerRotateAlignment:
                PopupMarkerLayerOptions.rotationAlignmentFor(AnchorAlign.top),
            popupBuilder: (BuildContext context, Marker marker) =>
                ExamplePopup(marker),
          ),
        ),
      ],
    );
  }

  reloadMarkers() {
    if (controller.ocorrencias.isNotEmpty) {
      setState(() {
        _markers = [UserMarker()]..addAll(controller.ocorrencias
            .map((ocorrencia) => OcorrenciaMarker(ocorrencia)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateColor.resolveWith((states) => Colors.red)),
                onPressed: () async {
                  await OrionApi.getAssaltos();
                  Navigator.of(context).pop();
                  reloadMarkers();
                },
                child: Text('Carregar Assaltos')),
            SizedBox(height: 10),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black)),
                onPressed: () async {
                  await OrionApi.getHomicidios();
                  Navigator.of(context).pop();
                  reloadMarkers();
                },
                child: Text('Carregar Homicídios')),
            SizedBox(height: 10),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.purple)),
                onPressed: () async {
                  await OrionApi.getRoubosDeCarros();
                  Navigator.of(context).pop();
                  reloadMarkers();
                },
                child: Text('Carregar Roubos de Carros')),
            SizedBox(height: 10),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white)),
                onPressed: () async {
                  await OrionApi.getOcorrencias();
                  Navigator.of(context).pop();
                  reloadMarkers();
                },
                child: Text('Carregar Todas Ocorrencias')),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: buildMap()),
          ],
        ),
      ),
    );
  }
}
