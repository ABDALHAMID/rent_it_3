import 'package:flutter/material.dart';
import 'package:rent_it_3/controllers/auth_controller.dart';
import 'package:rent_it_3/models/utilisateur.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthController _authController = AuthController();
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _firstName = '';
  String _lastName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
                onChanged: (value) => _firstName = value,
                validator: (value) => value == null || value.isEmpty ? 'Please enter your first name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
                onChanged: (value) => _lastName = value,
                validator: (value) => value == null || value.isEmpty ? 'Please enter your last name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) => _email = value,
                validator: (value) => value == null || value.isEmpty ? 'Please enter an email' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (value) => _password = value,
                validator: (value) => value == null || value.isEmpty ? 'Please enter a password' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() == true) {
                    Utilisateur utilisateur = Utilisateur(
                      prenom: _firstName,
                      nom: _lastName,
                      email: _email,
                      password: _password,
                      type: 'client',
                    );
                    try {
                      User? user = await _authController.register(_email, _password, utilisateur);
                      if (user != null) {
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration failed: $e')));
                    }
                  }
                },
                child: Text('Register'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
