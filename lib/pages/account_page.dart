import 'package:flutter/material.dart';
import 'package:rent_it_3/controllers/auth_controller.dart';
import 'package:rent_it_3/controllers/user_controller.dart';
import 'package:rent_it_3/models/utilisateur.dart';
import 'package:rent_it_3/helpers/session_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Utilisateur? currentUser;
  final AuthController _authController = AuthController();
  final UserController _userController = UserController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = _authController.getCurrentUser();
    if (user != null) {
      currentUser = await _userController.getUser(user.uid);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account')),
      body: Center(
        child: currentUser != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            currentUser!.imagePath != null
                ? Image.network(currentUser!.imagePath!)
                : Icon(Icons.account_circle, size: 100),
            Text("Name: ${currentUser!.prenom} ${currentUser!.nom}"),
            Text("Email: ${currentUser!.email}"),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _authController.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Logout'),
            ),
          ],
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}
