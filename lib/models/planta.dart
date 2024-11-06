class Planta {
  int id;
  String nome;
  String especie;
  List<String> cores;
  String modoCuidado;
  List<String> fotos;
  String regiaoOrigem;

  Planta({
    required this.id,
    required this.nome,
    required this.especie,
    required this.cores,
    required this.modoCuidado,
    required this.fotos,
    required this.regiaoOrigem,
  });

  // Método para converter um mapa JSON em um objeto Planta
  factory Planta.fromJson(Map<String, dynamic> json) {
    return Planta(
      id: json['id'],
      nome: json['nome'],
      especie: json['especie'],
      cores: List<String>.from(json['cores']),
      modoCuidado: json['modoCuidado'],
      fotos: List<String>.from(json['fotos']),
      regiaoOrigem: json['regiaoOrigem'],
    );
  }

  // Método para converter um objeto Planta em um mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'especie': especie,
      'cores': cores,
      'modoCuidado': modoCuidado,
      'fotos': fotos,
      'regiaoOrigem': regiaoOrigem,
    };
  }
}
