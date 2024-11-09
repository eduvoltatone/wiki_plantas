class Planta {
  int id;
  String nome;
  String descricao;
  String especie;
  List<String> cores;
  String modoCuidado;
  List<String> fotos;
  String regiaoOrigem;

  Planta({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.especie,
    required this.cores,
    required this.modoCuidado,
    required this.fotos,
    required this.regiaoOrigem,
  });

  factory Planta.fromJson(Map<String, dynamic> json) {
    return Planta(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      especie: json['especie'],
      cores: List<String>.from(json['cores']),
      modoCuidado: json['modo_cuidado'],
      fotos: List<String>.from(json['fotos']),
      regiaoOrigem: json['regiao_origem'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'especie': especie,
      'cores': cores,
      'modo_cuidado': modoCuidado,
      'fotos': fotos,
      'regiao_origem': regiaoOrigem,
    };
  }
}