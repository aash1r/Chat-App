import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key, required this.icon, required this.text, this.ontap});
  final IconData icon;
  final String text;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: Colors.white,
      textColor: Colors.white,
      leading: Icon(icon),
      title: Text(text),
      onTap: ontap,
    );
  }
}
