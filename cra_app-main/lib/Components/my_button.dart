import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:cra_complaints/Pages/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginButton(
      {super.key,
      required this.emailController,
      required this.passwordController});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  void signInUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return LoadingAnimationWidget.inkDrop(color: Colors.white, size: 50);
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: widget.emailController.text,
        password: widget.passwordController.text,
      );
      // pop the loading circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmailMessage();
      }

      // WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        // show error to user
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!',
        message: "I guess we haven't met yet!!",

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void wrongPasswordMessage() {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'You are close!',
        message: 'You just got your password wrong!',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.warning,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => const Page1()));
        signInUser();
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color(0xFF645CBB),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Sign In',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class CameraPick extends StatelessWidget {
  const CameraPick({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          //minimumSize: const Size.fromHeight(56),
        ),
        onPressed: () {},
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 5,
            ),
            const Icon(Icons.camera_alt_outlined),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Camera',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ));
  }
}

class GalleryPick extends StatelessWidget {
  const GalleryPick({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          //minimumSize: const Size.fromHeight(56),
        ),
        onPressed: () {},
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 5,
            ),
            const Icon(Icons.photo),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Gallery',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ));
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: 'Welcome Onboard',
          confirmBtnColor: Colors.deepPurple,
          onConfirmBtnTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const WelcomePage()));
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color(0xFF645CBB),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
