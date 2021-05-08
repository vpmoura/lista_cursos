import 'package:flutter/material.dart';
import 'package:lista_cursos/screens/plantas_detalhes_screen.dart';
import 'package:lista_cursos/screens/plantas_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => PlantasScreen(),
        '/plantas_detalhes': (context) => PlantasDetalhesScreen(),
      },
      title: 'Cursos App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

/*
theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
*/
