import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hello_kitty/app.dart';
import 'package:hello_kitty/view_models/cat_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CatViewModel(),
      child: const MyApp(),
    ),
  );
}
