import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BnavBar extends StatefulWidget {
  final Function callback;
  const BnavBar({super.key, required this.callback});

  @override
  // ignore: no_logic_in_create_state
  State<BnavBar> createState() => _BnavBarState(callback: callback);
}

class _BnavBarState extends State<BnavBar> {
  final Function callback;
  _BnavBarState({required this.callback});
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: const Color(0xFF645CBB),
              hoverColor: const Color(0xFF645CBB),
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color(0xFF645CBB),
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.add_circle_outline_outlined,
                  text: 'Add',
                ),
                GButton(
                  icon: Icons.assignment_outlined,
                  text: 'Record',
                ),
                GButton(
                  icon: Icons.person_outlined,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                callback(_selectedIndex);
              },
            ),
          ),
        ));
  }
}
