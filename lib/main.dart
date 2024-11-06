import 'package:flutter/material.dart';
import 'package:wiki_plantas/screens/home_screen.dart';
import 'package:wiki_plantas/screens/planta_form_page.dart';
import 'package:wiki_plantas/screens/plantas_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wiki de Plantas',
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardPage(),
        '/plantasList': (context) => PlantasListPage(),
        '/addPlanta': (context) => PlantaFormPage(),
        '/editPlanta': (context) => PlantaFormPage(), // A página de edição será a mesma do formulário
      },
    );
  }
}
