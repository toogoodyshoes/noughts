import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:noughts/features/authentication/presentation/login_page.dart';
// import 'package:noughts/features/authentication/presentation/sign_up_page.dart';
// import 'package:noughts/features/note/presentation/home_page.dart';

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
      home: const LoginPage(),
    );
  }
}
