import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hello_kitty/models/cat.dart';

class DetailScreen extends StatelessWidget {
  final Cat cat;

  const DetailScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    final breed = cat.breeds.isNotEmpty ? cat.breeds.first : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(breed?.name ?? 'Порода неизвестна'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: cat.imageUrl,
              placeholder: (context, url) => const SizedBox(
                height: 250,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            if (breed != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      breed.name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    if (breed.origin != null)
                      Text(
                        'Страна происхождения: ${breed.origin}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    const SizedBox(height: 8),
                    if (breed.temperament != null)
                      Text(
                        'Характер: ${breed.temperament}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    const SizedBox(height: 12),
                    if (breed.description != null)
                      Text(
                        breed.description!,
                        style: const TextStyle(fontSize: 16),
                      ),
                  ],
                ),
              ),
            ] else
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Информация о породе недоступна.'),
              ),
          ],
        ),
      ),
    );
  }
}
