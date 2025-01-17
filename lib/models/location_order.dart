class LocationOrder {
  int? id;
  int userId;
  int logementId;
  String status;

  LocationOrder({
    this.id,
    required this.userId,
    required this.logementId,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'logementId': logementId,
      'status': status,
    };
  }

  factory LocationOrder.fromMap(Map<String, dynamic> map) {
    return LocationOrder(
      id: map['id'],
      userId: map['userId'],
      logementId: map['logementId'],
      status: map['status'],
    );
  }

  LocationOrder copyWith({
    int? id,
    int? userId,
    int? logementId,
    String? status,
  }) {
    return LocationOrder(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      logementId: logementId ?? this.logementId,
      status: status ?? this.status,
    );
  }
}
