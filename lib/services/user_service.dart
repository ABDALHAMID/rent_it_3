import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_it_3/models/utilisateur.dart';

class UserService {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('utilisateurs');

  Future<List<Utilisateur>> fetchAllUsers() async {
    try {
      QuerySnapshot querySnapshot = await usersCollection.get();
      return querySnapshot.docs.map((doc) => Utilisateur.fromMap(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception("Failed to load users");
    }
  }

  Future<Utilisateur> fetchUser(String id) async { // Update parameter type to String
    try {
      DocumentSnapshot docSnapshot = await usersCollection.doc(id).get();
      return Utilisateur.fromMap(docSnapshot.data() as Map<String, dynamic>);
    } catch (e) {
      throw Exception("Failed to load user");
    }
  }

  Future<void> addUser(Utilisateur user) async {
    try {
      await usersCollection.add(user.toMap());
    } catch (e) {
      throw Exception("Failed to add user");
    }
  }

  Future<void> updateUser(Utilisateur user) async {
    try {
      await usersCollection.doc(user.id).update(user.toMap()); // Ensure id is used as String
    } catch (e) {
      throw Exception("Failed to update user");
    }
  }

  Future<void> deleteUser(String id) async { // Update parameter type to String
    try {
      await usersCollection.doc(id).delete(); // Ensure id is used as String
    } catch (e) {
      throw Exception("Failed to delete user");
    }
  }
}
