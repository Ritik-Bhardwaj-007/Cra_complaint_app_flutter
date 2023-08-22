import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Pattributes extends StatefulWidget {
  String val;
  Pattributes(this.val, {super.key});

  @override
  State<Pattributes> createState() => _PattributesState();
}

class _PattributesState extends State<Pattributes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.grey.shade400),
      child: Center(
        child: Text(
          widget.val,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
