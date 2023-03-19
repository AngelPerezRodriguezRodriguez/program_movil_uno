import 'package:flutter/material.dart';
import 'package:program_movil_uno/local_storage.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Bienvenida extends StatefulWidget {
  const Bienvenida({Key? key}) : super(key: key);

  @override
  State<Bienvenida> createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  File? _image;

  Future _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }
    File? img = File(image.path);

    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Hola ' +
                  (LocalStorage.prefs.getString('nombre') ?? 'extranjero') +
                  '\nveo que eres de ' +
                  (LocalStorage.prefs.getString('pais') ?? 'ninguna parte'),
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
                onPressed: () {
                  _pickImage();
                },
              ),
              margin: const EdgeInsets.only(top: 25),
            ),
            (_image == null)
                ? const Text('Falta una imagen')
                : Image.file((_image)!),
          ],
        ),
      ],
    );
  }
}
