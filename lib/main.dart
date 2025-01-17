import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart'; // Ensure this import exists
import 'package:rent_it_3/controllers/auth_controller.dart'; // Adjust import path as necessary

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    // Web specific options
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyD5WZFxs9s7bJGMSB_rQVWhB3-naHD3SgM",
        authDomain: "rent-it-3293d.firebaseapp.com",
        projectId: "rent-it-3293d",
        storageBucket: "rent-it-3293d.firebasestorage.app",
        messagingSenderId: "40906610320",
        appId: "1:40906610320:web:f72cdb41a62b74c2e76a15",
        // measurementId: "YOUR_MEASUREMENT_ID",
      ),
    );
  } else {
    // Mobile specific options
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rent It Mobile",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange),
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.grey),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.blue.withOpacity(0.6),
          )
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(), // Added RegisterPage route
        '/home': (context) => HomePage(),
      },
    );
  }
}

class AuthChecker extends StatelessWidget {
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data == true) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  Future<bool> checkLoginStatus() async {
    User? user = _authController.getCurrentUser();
    return user != null;
  }
}
