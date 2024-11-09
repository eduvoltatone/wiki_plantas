import 'package:flutter/material.dart';
import '../models/planta.dart';
import '../services/planta_service.dart';

class PlantaFormScreen extends StatefulWidget {
  @override
  _PlantaFormScreenState createState() => _PlantaFormScreenState();
}

class _PlantaFormScreenState extends State<PlantaFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final Planta planta = Planta(id: 0, nome: '', descricao: '', especie: '', cores: [], modoCuidado: '', fotos: [], regiaoOrigem: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Planta'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) => planta.nome = value!,
                validator: (value) => value!.isEmpty ? 'Por favor, insira um nome' : null,
              ),
              // Adicione outros campos do formulário aqui
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    PlantaService().createPlanta(planta).then((_) {
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}