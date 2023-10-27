import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key, this.ontap, required this.color});
  final void Function()? ontap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(25),
        child: const Center(
          child: Text("Tap"),
        ),
      ),
    );
  }
}
