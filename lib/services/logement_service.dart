import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_it_3/models/logement.dart';
import 'package:rent_it_3/services/upload_service.dart';
import 'dart:io';

class LogementService {
  final CollectionReference logementsCollection = FirebaseFirestore.instance.collection('logements');
  final UploadService _uploadService = UploadService();

  Future<List<Logement>> fetchAllLogements() async {
    try {
      QuerySnapshot querySnapshot = await logementsCollection.get();
      return querySnapshot.docs.map((doc) => Logement.fromMap(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception("Failed to load logements: $e");
    }
  }

  Future<void> addLogement(Logement logement, File imageFile) async {
    try {
      String imageURL = await _uploadService.uploadImage(imageFile);
      logement.imagePath = imageURL;
      await logementsCollection.add(logement.toMap());
    } catch (e) {
      throw Exception("Failed to add logement: $e");
    }
  }

  // Define 'imageFile' as an optional named parameter
  Future<void> updateLogement(Logement logement, {File? imageFile}) async {
    try {
      if (imageFile != null) {
        String imageURL = await _uploadService.uploadImage(imageFile);
        logement.imagePath = imageURL;
      }
      await logementsCollection.doc(logement.id.toString()).update(logement.toMap());
    } catch (e) {
      throw Exception("Failed to update logement: $e");
    }
  }

  Future<void> deleteLogement(int id) async {
    try {
      await logementsCollection.doc(id.toString()).delete();
    } catch (e) {
      throw Exception("Failed to delete logement: $e");
    }
  }
}
