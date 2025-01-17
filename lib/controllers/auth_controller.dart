import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent_it_3/models/utilisateur.dart';
import 'package:rent_it_3/services/user_service.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserService _userService = UserService();

  // Sign in with email and password
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  // Register a new user
  Future<User?> register(String email, String password, Utilisateur utilisateur) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        utilisateur.id = user.uid; // Assign Firebase user ID
        await _userService.addUser(utilisateur);
      }
      return user;
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
