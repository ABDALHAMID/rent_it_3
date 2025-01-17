import 'package:flutter/material.dart';
import 'package:rent_it_3/pages/home_logement.dart';
import 'package:rent_it_3/pages/add_logement_page.dart';
import 'package:rent_it_3/pages/account_page.dart';
import 'package:rent_it_3/pages/about_page.dart';
import 'package:rent_it_3/pages/current_logements_page.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 2; // Set to HomeLogement index

  static final List<Widget> _pages = <Widget>[
    AccountPage(),
    AddLogementPage(),
    HomeLogement(),
    AboutPage(),
    CurrentLogementsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
          ),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add Logement',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'About',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Current Logements',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Theme.of(context).primaryColor.withOpacity(0.6),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
