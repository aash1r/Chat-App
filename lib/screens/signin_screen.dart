import 'package:fire_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, this.ontap});
  final Function()? ontap;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final cpasscontroller = TextEditingController();

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
                const Text("Lets create an Account for you!"),
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
                  height: 20,
                ),
                MyTextfield(
                    hintText: "Confirm Password",
                    obsecureText: true,
                    controller: cpasscontroller),
                const SizedBox(
                  height: 40,
                ),
                MyButton(
                  text: "Sign In",
                  ontap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    GestureDetector(
                      onTap: widget.ontap,
                      child: GestureDetector(
                        onTap: widget.ontap,
                        child: Text(
                          " Login!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey.shade900),
                        ),
                      ),
                    ),
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
