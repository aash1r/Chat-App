import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/components/my_textfield.dart';
import 'package:fire_app/components/wall_posts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final postcontroller = TextEditingController();

  final currentUser = FirebaseAuth.instance.currentUser;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void postmessage() {
    if (postcontroller.text.isNotEmpty) {
      FirebaseFirestore.instance.collection("User Posts").add({
        "User": currentUser?.email,
        "Message": postcontroller.text,
        "TimeStamp": Timestamp.now(),
      });
      postcontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text("Home Screen"),
        actions: [
          GestureDetector(
            onTap: signOut,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("User Posts")
                      .orderBy("TimeStamp", descending: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final posts = snapshot.data!.docs[index];
                            return WallPosts(
                              postId: posts.id,
                              message: posts["Message"],
                              user: posts["User"],
                            );
                          });
                    } else if (snapshot.hasError) {
                      Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    }

                    return const CircularProgressIndicator();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: MyTextfield(
                        obsecureText: false,
                        hintText: "Enter your posts here",
                        controller: postcontroller),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: postmessage, child: const Icon(Icons.post_add)),
                  ),
                ],
              ),
            ),
            Text(
              "Youre logged in as ${currentUser?.email}",
              style: TextStyle(
                  color: Colors.grey.shade900, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
