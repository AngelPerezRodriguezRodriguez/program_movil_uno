import 'package:flutter/material.dart';
import 'package:program_movil_uno/local_storage.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  // Widget Form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(75)),
                ),
                hintText: 'Puedes usar sobrenombre',
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obligatorio';
                } else {
                  LocalStorage.prefs.setString('nombre', value);
                }
              },
            ),
            padding: const EdgeInsets.fromLTRB(60, 0, 60, 30),
            width: 600,
          ),
          Container(
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.airplanemode_active),
                labelText: 'País',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(75)),
                ),
                hintText: 'No importa de donde vengas',
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obligatorio';
                } else {
                  LocalStorage.prefs.setString('pais', value);
                }
              },
            ),
            padding: const EdgeInsets.fromLTRB(60, 0, 60, 30),
            width: 600,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Enviando información a página principal'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}
