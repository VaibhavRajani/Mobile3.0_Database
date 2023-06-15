import 'package:flutter/material.dart';
import '../BottomNavBar/siteSurveyPage.dart';
import '../BottomNavBar/dashboard.dart';
import '../BottomNavBar/account.dart';
import '../BottomNavBar/gallery.dart';

class Screen_mainPage extends StatefulWidget {
  const Screen_mainPage({super.key});

  @override
  State<Screen_mainPage> createState() => _Screen_mainPageState();
}

class _Screen_mainPageState extends State<Screen_mainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'SiteSurvey',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Account',
          ),
        ],
        backgroundColor: Colors.blueGrey,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 203, 203, 203),
      ),
      appBar: AppBar(
        leadingWidth: 90,
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: _title.elementAt(_selectedIndex),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}

const List<Widget> _pages = <Widget>[
  ProjectsScreen(),
  GalleryPage(),
  DashboardPage(),
  AccountPage(),
];

const List<Widget> _title = <Widget>[
  Text(
    "Site Survey",
    style: TextStyle(fontSize: 15, color: Colors.black),
  ),
  Text(
    "Gallery",
    style: TextStyle(fontSize: 15, color: Colors.black),
  ),
  Text(
    "Dashboard",
    style: TextStyle(fontSize: 15, color: Colors.black),
  ),
  Text(
    "Account",
    style: TextStyle(fontSize: 15, color: Colors.black),
  )
];
