// ignore: file_names
import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  const UserName({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        maxLines: 1,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF645CBB))),
          fillColor: Colors.grey.shade200,
          filled: true,
          labelText: 'Email',
          hintText: 'bt00xxx000@iiitn.ac.in',
          labelStyle: const TextStyle(
            color: Color(0xFF282828),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
