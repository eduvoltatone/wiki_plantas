import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wiki de Plantas")),
      body: Center(child: Text("Bem-vindo à Wiki de Plantas!")),
    );
  }
}
