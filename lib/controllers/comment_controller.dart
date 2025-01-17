import 'package:rent_it_3/models/commentaire.dart';
import 'package:rent_it_3/services/comment_service.dart';

class CommentController {
  final CommentService _commentService = CommentService();

  Future<List<Commentaire>> getAllComments() async {
    return await _commentService.fetchAllComments();
  }

  Future<List<Commentaire>> getCommentsForLogement(int logementId) async {
    return await _commentService.fetchCommentsForLogement(logementId);
  }

  Future<void> addComment(Commentaire comment) async {
    await _commentService.addComment(comment);
  }
}
