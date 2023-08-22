import 'package:cra_complaints/Components/loginTextField.dart';
import 'package:cra_complaints/Components/my_button.dart';
import 'package:cra_complaints/Pages/register.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // ignore: prefer_typing_uninitialized_variables
  var _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = true;
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              const Icon(
                Icons.book_rounded,
                size: 100,
                color: Colors.black38,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Welcome Back ',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(136, 12, 11, 11),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              UserName(
                controller: emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: passwordController,
                  maxLines: 1,
                  obscureText: _isObscured,
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
                      suffixIcon: IconButton(
                        color: const Color(0xFF645CBB),
                        icon: _isObscured
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      )),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              LoginButton(
                emailController: emailController,
                passwordController: passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a Member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0xFF645CBB),
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ],
          )),
    );
  }
}
