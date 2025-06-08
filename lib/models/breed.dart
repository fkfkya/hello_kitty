class Breed {
  final String id;
  final String name;
  final String? description;
  final String? temperament;
  final String? origin;

  const Breed({
    required this.id,
    required this.name,
    this.description,
    this.temperament,
    this.origin,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
      temperament: json['temperament'],
      origin: json['origin'],
    );
  }
}
