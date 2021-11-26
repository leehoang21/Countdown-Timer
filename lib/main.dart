import 'package:couwn_douwn/my_app.dart';
import 'package:couwn_douwn/provider/provider_images_position.dart';
import 'package:couwn_douwn/provider/provider_time.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProviderImagePosition()),
      ChangeNotifierProvider(create: (_) => ProviderTime()),
    ],
    child: const MaterialApp(
      home: MyApp(),
    ),
  ));
}
