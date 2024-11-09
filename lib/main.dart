import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(WikiPlantasApp());
}

class WikiPlantasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wiki Plantas',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}