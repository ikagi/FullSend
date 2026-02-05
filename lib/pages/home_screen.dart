import 'package:flutter/cupertino.dart';
import 'package:full_send/pages/garage_screen.dart';
import 'package:full_send/pages/convoy_screen.dart';
import 'package:full_send/pages/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        height: 70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.car),
            label: 'Garaż',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2),
            label: 'Konwój',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_circle),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const GarageScreen();
          case 1:
            return const ConvoyScreen();
          case 2:
            return const ProfileScreen();
          default:
            return const GarageScreen();
        }
      },
    );
  }
}