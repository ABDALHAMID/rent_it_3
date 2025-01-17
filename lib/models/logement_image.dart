class LogementImage {
  int? id;
  int logementId;
  String imagePath = 'assets/images/default_image.jpg';

  LogementImage({
    this.id,
    required this.logementId,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'logement_id': logementId,
      'image_path': imagePath,
    };
  }

  factory LogementImage.fromMap(Map<String, dynamic> map) {
    return LogementImage(
      id: map['id'],
      logementId: map['logement_id'],
      imagePath: map['image_path'] ?? 'assets/images/default_image.jpg',
    );
  }

  LogementImage copyWith({
    int? id,
    int? logementId,
    String? imagePath,
  }) {
    return LogementImage(
      id: id ?? this.id,
      logementId: logementId ?? this.logementId,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
