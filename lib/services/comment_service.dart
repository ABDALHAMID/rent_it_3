import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_it_3/models/commentaire.dart';

class CommentService {
  final CollectionReference commentsCollection = FirebaseFirestore.instance.collection('commentaires');

  Future<List<Commentaire>> fetchAllComments() async {
    try {
      QuerySnapshot querySnapshot = await commentsCollection.get();
      return querySnapshot.docs.map((doc) => Commentaire.fromMap(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception("Failed to load comments");
    }
  }

  Future<List<Commentaire>> fetchCommentsForLogement(int logementId) async {
    try {
      QuerySnapshot querySnapshot = await commentsCollection.where('logement_id', isEqualTo: logementId).get();
      return querySnapshot.docs.map((doc) => Commentaire.fromMap(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception("Failed to load comments");
    }
  }

  Future<void> addComment(Commentaire comment) async {
    try {
      await commentsCollection.add(comment.toMap());
    } catch (e) {
      throw Exception("Failed to add comment");
    }
  }
}

