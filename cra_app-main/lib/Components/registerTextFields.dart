// ignore: file_names
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
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

class PassField extends StatelessWidget {
  const PassField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF645CBB))),
          fillColor: Colors.grey.shade200,
          filled: true,
          labelText: 'Password',
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class Fname extends StatelessWidget {
  const Fname({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF645CBB))),
          fillColor: Colors.grey.shade200,
          filled: true,
          labelText: 'First Name',
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class Lname extends StatelessWidget {
  const Lname({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF645CBB))),
          fillColor: Colors.grey.shade200,
          filled: true,
          labelText: 'Last Name',
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
