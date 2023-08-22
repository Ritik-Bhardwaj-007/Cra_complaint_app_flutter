import 'package:cra_complaints/Components/my_button.dart';
import 'package:cra_complaints/Components/registerTextFields.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      child: const CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.deepPurple,
                    child: CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage('assets/default_pic.jpg'),
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Fname(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Lname(),
                  const SizedBox(
                    height: 10,
                  ),
                  const EmailField(),
                  const SizedBox(
                    height: 10,
                  ),
                  const PassField(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SignUpButton(),
                ],
              )),
        ));
  }
}
