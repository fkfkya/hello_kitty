import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hello_kitty/view_models/cat_view_model.dart';
import 'package:hello_kitty/widgets/cat_card.dart';
import 'package:hello_kitty/widgets/like_button.dart';
import 'package:hello_kitty/widgets/dislike_button.dart';
import 'package:hello_kitty/views/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CatViewModel>(
      builder: (context, viewModel, child) {
        final cat = viewModel.currentCat;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Котондитер'),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    '❤️ ${viewModel.likeCount}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          body: viewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : viewModel.errorMessage != null
                  ? Center(child: Text(viewModel.errorMessage!))
                  : cat == null
                      ? const Center(child: Text('Котик не найден'))
                      : GestureDetector(
                          onHorizontalDragEnd: (details) {
                            if (details.primaryVelocity != null) {
                              if (details.primaryVelocity! > 0) {
                                viewModel.likeCurrentCat();
                              } else {
                                viewModel.skipCurrentCat();
                              }
                            }
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: CatCard(
                                  cat: cat,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DetailScreen(cat: cat),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DislikeButton(onPressed: viewModel.skipCurrentCat),
                                  const SizedBox(width: 16),
                                  LikeButton(onPressed: viewModel.likeCurrentCat),
                                ],
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
        );
      },
    );
  }
}
