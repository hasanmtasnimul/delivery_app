import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void LogoutUser() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
              onPressed: LogoutUser, icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(child: Text('this is homepage')),
    );
  }
}
