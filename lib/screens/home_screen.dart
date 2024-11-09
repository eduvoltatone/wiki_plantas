import 'package:flutter/material.dart';
import 'planta_list_screen.dart';

class HomeScreen extends StatelessWidget {
  // Lista de plantas com seus nomes e caminhos das imagens
  final List<Map<String, String>> plantas = [
    {
      'nome': 'Planta 1',
      'imagem': 'assets/imagens/planta1.jpg', // Adicione o caminho correto da sua imagem
    },
    {
      'nome': 'Planta 2',
      'imagem': 'assets/imagens/planta2.jpg', // Adicione o caminho correto da sua imagem
    },
    {
      'nome': 'Planta 3',
      'imagem': 'assets/imagens/planta3.jpg', // Adicione o caminho correto da sua imagem
    },
    // Adicione mais plantas conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wiki Plantas'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Número de colunas
          childAspectRatio: 0.75, // Proporção do tamanho dos itens
        ),
        itemCount: plantas.length,
        itemBuilder: (context, index) {
          return _buildPlantCard(plantas[index]['imagem']!, plantas[index]['nome']!);
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Lista de Plantas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlantaListScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir um card de planta
  Widget _buildPlantCard(String imagePath, String plantName) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              plantName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}