import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

String nombre = 'extranjero';
String pais = 'ninguna parte';

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
                  nombre = value;
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
                  pais = value;
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

class Bienvenida extends StatefulWidget {
  const Bienvenida({Key? key}) : super(key: key);

  @override
  State<Bienvenida> createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Hola $nombre\nveo que eres de $pais',
              style: const TextStyle(
                fontFamily: 'Broken',
                fontSize: 50,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'AUN ASI NO PUEDES ACCEDER',
              style: TextStyle(
                fontFamily: 'Punk-is-not-Dead',
                fontSize: 60,
              ),
            ),
            Image.asset(
              'imagenes/soldado.png',
              height: 400,
            ),
            Container(
              child: ElevatedButton(
                child: const Text('Cargar imagen'),
                onPressed: () async {
                  final ImagePicker _picker = ImagePicker();
                  XFile _pickedFile =
                      (await _picker.pickImage(source: ImageSource.gallery))!;
                  imagePath = _pickedFile.path;
                  setState(() {});
                },
              ),
              margin: const EdgeInsets.only(top: 25),
            ),
            (imagePath.isEmpty)
                ? Container()
                : Image.file(
                    File(imagePath),
                    width: 90,
                    height: 90,
                  ),
          ],
        ),
      ],
    );
  }
}

/*
onSaved: (String? value) {
              nombre = value!;
            },
 */
