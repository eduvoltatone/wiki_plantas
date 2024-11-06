import 'package:flutter/material.dart';
import '../models/planta.dart';
import '../services/planta_service.dart';

class PlantasListPage extends StatefulWidget {
  @override
  _PlantasListPageState createState() => _PlantasListPageState();
}

class _PlantasListPageState extends State<PlantasListPage> {
  final PlantaService _plantaService = PlantaService();
  List<Planta> _plantas = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPlantas();
  }

  Future<void> _fetchPlantas() async {
    try {
      final plantas = await _plantaService.getPlantas();
      setState(() {
        _plantas = plantas;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Erro ao carregar as plantas: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Plantas")),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _plantas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_plantas[index].nome),
                  subtitle: Text(_plantas[index].especie),
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/editPlanta',
                    arguments: _plantas[index],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/addPlanta'),
      ),
    );
  }
}
