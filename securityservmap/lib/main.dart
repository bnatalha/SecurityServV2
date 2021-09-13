import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:securityservmap/src/home/home.controller.dart';
import 'package:securityservmap/src/home/home.screen.dart';

void main() {
  runApp(MyApp());
  GetIt.I.registerSingleton(HomeController());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PD - FIMWARE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SimpleMapWithPopups(),
      home: MyHomePage(title: 'SecurityServ-v1'),
    );
  }
}
