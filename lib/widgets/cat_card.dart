import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hello_kitty/models/cat.dart';

class CatCard extends StatelessWidget {
  final Cat cat;
  final VoidCallback onTap;

  const CatCard({
    super.key,
    required this.cat,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final breedName = cat.breeds.isNotEmpty ? cat.breeds.first.name : 'Неизвестная порода';

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: cat.imageUrl,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.black.withAlpha(179),
            width: double.infinity,
            child: Text(
              breedName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
