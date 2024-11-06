import 'package:dbu/pages/home_page.dart';
import 'package:dbu/pages/login_or_register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //User logged in
          if (snapshot.hasData) {
            return  Homepage ();
          }

          //user NOT logged in
          else {
            return const LoginOrRegisterPage();
          }
        }
      )
    );
  }
}


