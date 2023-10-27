import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, this.ontap, required this.text});
  final Function()? ontap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        child: Center(
          child: Text(
            text ?? "",
            style: const TextStyle(
                color: Color.fromARGB(153, 4, 3, 3),
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
      ),
    );
  }
}
