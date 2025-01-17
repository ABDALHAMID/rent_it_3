class LogementAmenity {
  int? id;
  int logementId;
  String amenity;

  LogementAmenity({
    this.id,
    required this.logementId,
    required this.amenity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'logementId': logementId,
      'amenity': amenity,
    };
  }

  factory LogementAmenity.fromMap(Map<String, dynamic> map) {
    return LogementAmenity(
      id: map['id'],
      logementId: map['logementId'],
      amenity: map['amenity'],
    );
  }

  LogementAmenity copyWith({
    int? id,
    int? logementId,
    String? amenity,
  }) {
    return LogementAmenity(
      id: id ?? this.id,
      logementId: logementId ?? this.logementId,
      amenity: amenity ?? this.amenity,
    );
  }
}
