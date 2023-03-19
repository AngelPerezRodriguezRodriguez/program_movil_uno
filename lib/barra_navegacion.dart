import 'package:flutter/material.dart';
import 'bienvenida.dart';
import 'calculadora.dart';
import 'campo_texto.dart';

class BarraNavegacion extends StatefulWidget {
  const BarraNavegacion({Key? key}) : super(key: key);

  @override
  State<BarraNavegacion> createState() => _BarraNavegacionState();
}

class _BarraNavegacionState extends State<BarraNavegacion> {
  int _selectedIndex = 0;

  // Lista de Widgets desplegados
  static const List<Widget> _widgetOptions = <Widget>[
    Bienvenida(),
    Calculadora(),
    CampoTexto(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          'Segunda Asignación',
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Bienvenida',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Calculadora',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Datos',
          ),
        ],
        // Current index of navigation bar is equal to list index
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
