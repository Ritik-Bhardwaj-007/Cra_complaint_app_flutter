import 'package:cra_complaints/Components/profileattributes.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.grey.shade400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '@username',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 70,
          ),
          Pattributes('Name'),
          const SizedBox(
            height: 20,
          ),
          Pattributes('Password'),
        ],
      ),
    );
  }
}
