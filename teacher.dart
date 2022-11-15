import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 650,
          ),
          ElevatedButton.icon(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
            ),
            label: const Text('Sign Out'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(60),
            ),
          ),
        ],
      ),
    );
  }
}
