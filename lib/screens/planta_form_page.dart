import 'package:flutter/material.dart';
import '../models/planta.dart';
import '../services/planta_service.dart';

class PlantaFormPage extends StatefulWidget {
  @override
  _PlantaFormPageState createState() => _PlantaFormPageState();
}

class _PlantaFormPageState extends State<PlantaFormPage> {
  final _formKey = GlobalKey<FormState>();
  final PlantaService _plantaService = PlantaService();

  late TextEditingController _nomeController;
  late TextEditingController _especieController;
  late TextEditingController _coresController;
  late TextEditingController _modoCuidadoController;
  late TextEditingController _regiaoOrigemController;

  Planta? planta; // Planta recebida como argumento

  @override
  void initState() {
    super.initState();

    // Receber a planta selecionada como argumento
    planta = ModalRoute.of(context)?.settings.arguments as Planta?;

    // Inicializar os controladores com os valores da planta (se houver)
    _nomeController = TextEditingController(text: planta?.nome ?? '');
    _especieController = TextEditingController(text: planta?.especie ?? '');
    _coresController = TextEditingController(text: planta?.cores.join(', ') ?? '');
    _modoCuidadoController = TextEditingController(text: planta?.modoCuidado ?? '');
    _regiaoOrigemController = TextEditingController(text: planta?.regiaoOrigem ?? '');
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _especieController.dispose();
    _coresController.dispose();
    _modoCuidadoController.dispose();
    _regiaoOrigemController.dispose();
    super.dispose();
  }

  void _savePlanta() async {
    if (_formKey.currentState!.validate()) {
      Planta newPlanta = Planta(
        id: planta?.id ?? 0, // Usa 0 para um novo id, será ignorado pelo json-server
        nome: _nomeController.text,
        especie: _especieController.text,
        cores: _coresController.text.split(',').map((c) => c.trim()).toList(),
        modoCuidado: _modoCuidadoController.text,
        fotos: [], // Adicione um mecanismo para carregar fotos
        regiaoOrigem: _regiaoOrigemController.text,
      );

      if (planta == null) {
        // Adiciona nova planta
        await _plantaService.addPlanta(newPlanta);
      } else {
        // Atualiza planta existente
        await _plantaService.updatePlanta(newPlanta);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planta == null ? 'Adicionar Planta' : 'Editar Planta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome da planta';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _especieController,
                decoration: InputDecoration(labelText: 'Espécie'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a espécie da planta';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _coresController,
                decoration: InputDecoration(
                  labelText: 'Cores',
                  hintText: 'Separe as cores por vírgula (ex: verde, vermelho)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira as cores da planta';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _modoCuidadoController,
                decoration: InputDecoration(labelText: 'Modo de Cuidado'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o modo de cuidado';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _regiaoOrigemController,
                decoration: InputDecoration(labelText: 'Região de Origem'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a região de origem';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _savePlanta,
                child: Text(planta == null ? 'Adicionar' : 'Salvar Alterações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
