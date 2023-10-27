import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WallPosts extends StatefulWidget {
  const WallPosts({
    super.key,
    required this.message,
    required this.user,
    required this.postId,
  });
  final String message;
  final String user;
  final String postId;

  @override
  State<WallPosts> createState() => _WallPostsState();
}

class _WallPostsState extends State<WallPosts> {
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.blue.shade500,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Column(
              children: [
                Text(widget.message),
                Text(widget.user),
              ],
            )
          ],
        ),
      ),
    );
  }
}
