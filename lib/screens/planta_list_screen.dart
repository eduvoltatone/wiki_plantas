import 'package:flutter/material.dart';
import '../models/planta.dart';
import '../services/planta_service.dart';
import 'planta_form_screen.dart';

class PlantaListScreen extends StatefulWidget {
  @override
  _PlantaListScreenState createState() => _PlantaListScreenState();
}

class _PlantaListScreenState extends State<PlantaListScreen> {
  late Future<List<Planta>> futurePlantas;

  @override
  void initState() {
    super.initState();
    futurePlantas = PlantaService().fetchPlantas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Plantas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlantaFormScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Planta>>(
        future: futurePlantas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else {
            final plantas = snapshot.data!;
            return ListView.builder(
              itemCount: plantas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(plantas[index].nome),
                  onTap: () {
                    // Navegar para a tela de detalhes ou edição
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}