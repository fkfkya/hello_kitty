import 'package:hello_kitty/models/breed.dart';

class Cat {
  final String id;
  final String imageUrl;
  final List<Breed> breeds;

  const Cat({
    required this.id,
    required this.imageUrl,
    required this.breeds,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    final breedsJson = json['breeds'] as List<dynamic>? ?? [];
    final breeds = breedsJson.map((b) => Breed.fromJson(b)).toList();

    return Cat(
      id: json['id'] ?? '',
      imageUrl: json['url'] ?? '',
      breeds: breeds,
    );
  }
}
