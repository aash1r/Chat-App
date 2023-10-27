import 'package:fire_app/components/my_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.grey.shade900,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Icon(Icons.person),
          Text(
            "${currentUser?.email}",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
