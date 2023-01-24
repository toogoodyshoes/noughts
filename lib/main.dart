import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:noughts/firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Noughts());
}

class Noughts extends StatelessWidget {
  const Noughts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Center(child: Text('Flutter Demo Home Page')),
    );
  }
}
