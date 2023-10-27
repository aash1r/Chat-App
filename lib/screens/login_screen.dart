import 'dart:developer';

import 'package:fire_app/components/my_button.dart';
import 'package:fire_app/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.ontap});
  final Function()? ontap;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  void signIn() async {
    String email = emailcontroller.text.trim();
    String password = passcontroller.text.trim();

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Welcome!"),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                    hintText: "Email",
                    obsecureText: false,
                    controller: emailcontroller),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                    hintText: "Password",
                    obsecureText: true,
                    controller: passcontroller),
                const SizedBox(
                  height: 40,
                ),
                  MyButton(
                  text: "Login",
                  ontap: signIn,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member?"),
                    GestureDetector(
                      onTap: widget.ontap,
                      child: Text(
                        " Sign In!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade900),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
