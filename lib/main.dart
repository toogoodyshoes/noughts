import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:noughts/router.dart';
import 'package:noughts/firebase_options.dart';
import 'package:noughts/features/authentication/presentation/authentication_provider.dart';

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
    return ChangeNotifierProvider<AuthenticationProvider>(
      create: (context) => AuthenticationProvider(),
      child: MaterialApp.router(
        title: 'Noughts',
        theme: ThemeData.dark(),
        routerConfig: router,
      ),
    );
  }
}
