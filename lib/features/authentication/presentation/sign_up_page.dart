import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:noughts/features/authentication/presentation/authentication_provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _confirmPassword;

  @override
  void initState() {
    super.initState();

    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
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
              crossAxisAlignment: CrossAxisAlignment.end,
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

                /// Confirm Password
                SizedBox(
                  width: min(MediaQuery.of(context).size.width, 400.0),
                  child: TextField(
                    controller: _confirmPassword,
                    decoration: const InputDecoration(
                      hintText: 'Confirm Password',
                    ),
                  ),
                ),

                const SizedBox(height: 16.0),

                /// Sign Up Button
                TextButton(
                  onPressed: () {
                    context.read<AuthenticationProvider>().logIn();
                    context.go('/');
                  },
                  child: const Text('Sign Up'),
                ),

                const Spacer(),

                /// Login Button
                TextButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
