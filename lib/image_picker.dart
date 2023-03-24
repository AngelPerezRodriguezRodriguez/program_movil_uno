import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SelectorImagen {
  final _imagePicker = ImagePicker();

  Future<File?> obtenerImagen() async {
    final _imagen = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (_imagen != null) {
      return File(_imagen.path);
    }
    return null;
  }
}
