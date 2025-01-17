import 'package:rent_it_3/models/utilisateur.dart';
import 'package:rent_it_3/services/user_service.dart';

class UserController {
  final UserService _userService = UserService();

  Future<List<Utilisateur>> getAllUsers() async {
    return await _userService.fetchAllUsers();
  }

  Future<Utilisateur> getUser(String id) async { // Update parameter type to String
    return await _userService.fetchUser(id);
  }

  Future<void> addUser(Utilisateur user) async {
    await _userService.addUser(user);
  }

  Future<void> updateUser(Utilisateur user) async {
    await _userService.updateUser(user);
  }

  Future<void> deleteUser(String id) async { // Update parameter type to String
    await _userService.deleteUser(id);
  }
}
