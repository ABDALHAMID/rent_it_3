import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_it_3/models/logement_image.dart';

class LogementImageService {
  final CollectionReference logementImagesCollection = FirebaseFirestore.instance.collection('logement_images');

  Future<List<LogementImage>> fetchImagesForLogement(int logementId) async {
    try {
      QuerySnapshot querySnapshot = await logementImagesCollection.where('logement_id', isEqualTo: logementId).get();
      return querySnapshot.docs.map((doc) => LogementImage.fromMap(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception("Failed to load images");
    }
  }
}
