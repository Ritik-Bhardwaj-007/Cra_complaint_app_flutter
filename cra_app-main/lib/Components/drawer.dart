import "package:cra_complaints/Pages/homepage.dart";
import "package:cra_complaints/Pages/team.dart";
import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shadowColor: Colors.black54,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(
                  child: Text(
                'L O G O',
                style: TextStyle(fontSize: 35),
              )),
            ),
            const Divider(),
            ListTile(
              hoverColor: Colors.black26,
              leading: const Icon(Icons.home_work_rounded),
              title: const Text(
                'Complaints',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Page1(),
                ));
              },
            ),
            ListTile(
              hoverColor: Colors.black26,
              leading: const Icon(Icons.message_rounded),
              title: const Text(
                'Chat',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            ListTile(
              hoverColor: Colors.black26,
              leading: const Icon(Icons.person_rounded),
              title: const Text(
                'Team',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Team()));
              },
            ),
            ListTile(
              hoverColor: Colors.black26,
              leading: const Icon(Icons.laptop_chromebook_rounded),
              title: const Text(
                'Developer',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
