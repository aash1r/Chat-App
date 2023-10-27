import 'package:fire_app/components/my_list_tile.dart';
import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade900,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Icon(
            Icons.person,
            color: Colors.white,
            size: 70,
          ),
          MyListTile(
            icon: Icons.home,
            text: "H O M E",
            ontap: () => Navigator.pop(context),
          ),
          MyListTile(
            icon: Icons.person,
            text: "P R O F I L E",
            ontap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()));
            },
          ),
        ],
      ),
    );
  }
}
