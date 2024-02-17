// ignore_for_file: prefer_const_constructors, file_names, unused_import

import 'package:flutter/material.dart';
import 'package:hamza/screens/home-screen.dart';
import 'package:hamza/screens/intro-page.dart';
import 'package:hamza/screens/login-page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return homePage();
          } else {
            return intropage();
          }
        }),
      ),
    );
  }
}
