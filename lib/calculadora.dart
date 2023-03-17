import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String numTemporal = '';
  bool opeUnoOcupado = false;

  double operandoUno = 0;
  String operador = '';
  double operandoDos = 0;

  String historial = '';
  String impresion = '';

  void _numero(String numero) {
    setState(() {
      // Evita agregar números y punto al resultado
      if ((numero != '.' ||
              numero == '.' && numTemporal.contains('.') == false) &&
          (opeUnoOcupado == false ||
              opeUnoOcupado == true && operador.isNotEmpty)) {
        numTemporal += numero;
        impresion += numero;
      }
    });
  }

  void _operacion(String operador) {
    setState(() {
      // Evita el operador al inicio y repetir el operador
      if (impresion.isNotEmpty && this.operador.isEmpty) {
        this.operador = operador;
        opeUnoOcupado = true;

        operandoUno = double.tryParse(numTemporal)!;
        numTemporal = '';

        impresion += operador;
      }
    });
  }

  void _igual() {
    setState(() {
      // Asegura el 1er operando, el operador y un valor para el 2do operando
      // para poder calcular un resultado
      if (opeUnoOcupado == true &&
          operador.isNotEmpty &&
          numTemporal.isNotEmpty) {
        operandoDos = double.tryParse(numTemporal)!;
        historial = impresion;

        switch (operador) {
          case ' x ':
            operandoUno = operandoUno * operandoDos;
            break;
          case ' - ':
            operandoUno = operandoUno - operandoDos;
            break;
          case ' + ':
            operandoUno = operandoUno + operandoDos;
            break;
          case ' / ':
            if (operandoDos == 0) {
              historial = 'Math Error';
              return;
            }
            operandoUno = operandoUno / operandoDos;
            break;
        }
        impresion = operandoUno.toString();
        operador = '';
        numTemporal = operandoUno.toString();
        // numTemporal debe dejar el valor de operandoDos por _operacion
      }
    });
  }

  void _limpiar() {
    setState(() {
      numTemporal = '';
      opeUnoOcupado = false;

      operandoUno = 0;
      operador = '';
      operandoDos = 0;

      historial = '';
      impresion = '';
    });
  }

  Widget _boton(String textoBttn, String accion, Color colorBttn) {
    return ElevatedButton(
      child: Text(
        textoBttn,
        style: const TextStyle(fontSize: 35),
      ),
      onPressed: () {
        if (accion == 'numero') {
          _numero(textoBttn);
        } else if (accion == 'operador') {
          _operacion(textoBttn);
        } else if (accion == 'igual') {
          _igual();
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(80, 80),
        primary: colorBttn,
        shape: const CircleBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('imagenes/02.jpg'), fit: BoxFit.cover),
      ),
      child: ListView(
        children: <Widget> [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Text(
                    '\n' +
                        historial +
                        '\n' +
                        impresion +
                        '\n...........................\n',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 40,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // Solid text as fill.
                  Text(
                    '\n' +
                        historial +
                        '\n' +
                        impresion +
                        '\n...........................\n',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _boton('1', 'numero', Colors.amber),
                  _boton('2', 'numero', Colors.amber),
                  _boton('3', 'numero', Colors.amber),
                  _boton(' x ', 'operador', Colors.deepPurple),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _boton('4', 'numero', Colors.amber),
                  _boton('5', 'numero', Colors.amber),
                  _boton('6', 'numero', Colors.amber),
                  _boton(' - ', 'operador', Colors.deepPurple),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _boton('7', 'numero', Colors.amber),
                  _boton('8', 'numero', Colors.amber),
                  _boton('9', 'numero', Colors.amber),
                  _boton(' + ', 'operador', Colors.deepPurple),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _boton(' / ', 'operador', Colors.deepPurple),
                  _boton('0', 'numero', Colors.amber),
                  _boton('.', 'numero', Colors.amber),
                  _boton('=', 'igual', Colors.blue),
                ],
              ),
              Container(
                child: ElevatedButton(
                  child: const Text(
                    'Clean',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    _limpiar();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(145, 50),
                  ),
                ),
                margin: const EdgeInsets.only(top: 25, bottom: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
