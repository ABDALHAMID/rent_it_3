class Commentaire {
  int? num;
  int userId;
  String commentaire;
  DateTime dateCommentaire;

  Commentaire({
    this.num,
    required this.userId,
    required this.commentaire,
    required this.dateCommentaire,
  });

  Map<String, dynamic> toMap() {
    return {
      'num': num,
      'userId': userId,
      'commentaire': commentaire,
      'dateCommentaire': dateCommentaire.toIso8601String(),
    };
  }

  factory Commentaire.fromMap(Map<String, dynamic> map) {
    return Commentaire(
      num: map['num'],
      userId: map['userId'],
      commentaire: map['commentaire'],
      dateCommentaire: DateTime.parse(map['dateCommentaire']),
    );
  }

  Commentaire copyWith({
    int? num,
    int? userId,
    String? commentaire,
    DateTime? dateCommentaire,
  }) {
    return Commentaire(
      num: num ?? this.num,
      userId: userId ?? this.userId,
      commentaire: commentaire ?? this.commentaire,
      dateCommentaire: dateCommentaire ?? this.dateCommentaire,
    );
  }
}
