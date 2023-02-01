import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:noughts/features/authentication/presentation/authentication_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _email;
  late TextEditingController _password;

  @override
  void initState() {
    super.initState();

    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: min(MediaQuery.of(context).size.width, 400.0),
            height: double.infinity,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// Email
                SizedBox(
                  width: min(MediaQuery.of(context).size.width, 400.0),
                  child: TextField(
                    controller: _email,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                ),

                const SizedBox(height: 16.0),

                /// Password
                SizedBox(
                  width: min(MediaQuery.of(context).size.width, 400.0),
                  child: TextField(
                    controller: _password,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                ),

                const SizedBox(height: 16.0),

                /// Login Button
                TextButton(
                  onPressed: () {
                    context.read<AuthenticationProvider>().logIn();
                    context.go('/');
                  },
                  child: const Text('Login'),
                ),

                const Spacer(),

                /// Sign-Up Button
                TextButton(
                  onPressed: () {
                    context.go('/sign-up');
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
