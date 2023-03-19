import 'package:flutter/material.dart';
import 'package:program_movil_uno/barra_navegacion.dart';
import 'package:program_movil_uno/local_storage.dart';

void main() async{
  await LocalStorage.configurePrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Programación Móvil 1';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: BarraNavegacion(),
    );
  }
}
