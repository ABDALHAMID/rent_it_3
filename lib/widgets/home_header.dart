import 'package:flutter/material.dart';
import 'package:rent_it_3/controllers/auth_controller.dart';

class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Rent It'),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () async {
            try {
              await _authController.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            } catch (e) {
              print('Error signing out: $e');
            }
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(48.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search Logements...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 48.0);
}