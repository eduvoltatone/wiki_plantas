import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/planta.dart';

class PlantaService {
  final String baseUrl = 'http://localhost:3000/plantas';

  Future<List<Planta>> getPlantas() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((data) => Planta.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load plantas');
    }
  }

  Future<void> addPlanta(Planta planta) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(planta.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add planta');
    }
  }

  Future<void> updatePlanta(Planta planta) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${planta.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(planta.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update planta');
    }
  }
}
