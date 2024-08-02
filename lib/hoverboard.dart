class Hoverboard {
  final int id;
  final String marca;
  final String modelo;
  final double velocidadMaxima;
  final double autonomia;

  Hoverboard({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.velocidadMaxima,
    required this.autonomia,
  });

  factory Hoverboard.fromJson(Map<String, dynamic> json) {
    return Hoverboard(
      id: json['id'],
      marca: json['marca'],
      modelo: json['modelo'],
      velocidadMaxima: json['velocidadMaxima'],
      autonomia: json['autonomia'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'marca': marca,
    'modelo': modelo,
    'velocidadMaxima': velocidadMaxima,
    'autonomia': autonomia,
  };
}
