import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_demo_flutter_app/views/shopping_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final screens = [
    ShoppingPage(),
    Center(
      child: Text(
        'Likes',
        style: TextStyle(fontSize: 60),
      ),
    ),
    Center(
      child: Text(
        'Search',
        style: TextStyle(fontSize: 60),
      ),
    ),
    Center(
      child: Text(
        'Settings',
        style: TextStyle(fontSize: 60),
      ),
    ),
  ];

  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreen],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey,
            gap: 0,
            padding: EdgeInsets.all(16.0),
            onTabChange: (index) {
              setState(() {
                currentScreen = index;
              });
              print(index);
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Likes',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
