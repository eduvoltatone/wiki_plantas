import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/planta.dart';

class PlantaService {
  final String baseUrl = 'http://localhost:3000/plantas';

  Future<List<Planta>> fetchPlantas() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((planta) => Planta.fromJson(planta)).toList();
    } else {
      throw Exception('Failed to load plantas');
    }
  }

  Future<Planta> createPlanta(Planta planta) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(planta.toJson()),
    );
    if (response.statusCode == 201) {
      return Planta.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create planta');
    }
  }

  // Adicione métodos para atualizar e deletar plantas conforme necessário.
}