import 'package:cra_complaints/Components/bottom_navbar.dart';
import 'package:cra_complaints/Components/drawer.dart';
import 'package:cra_complaints/Pages/complaintpage.dart';
import 'package:cra_complaints/Pages/hometab.dart';
import 'package:cra_complaints/Pages/mycomplaintspage.dart';
import 'package:cra_complaints/Pages/profilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final List _pagesToShow = const [
    HomeTab(),
    ComplaintPage(),
    MyCompTab(),
    ProfileTab(),
  ];
  int selectedIndex = 0;

  callback(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('A P P B A R'),
        backgroundColor: Colors.deepPurple,
        // leading:
        //     IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded)),
        centerTitle: true,
        elevation: 4,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BnavBar(callback: callback),
      body: _pagesToShow[selectedIndex],
    );
  }
}
