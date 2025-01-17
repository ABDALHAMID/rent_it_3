class Utilisateur {
  String? id; // Ensure id is a String type
  String prenom;
  String nom;
  String email;
  String password;
  String? imagePath;
  String type;

  Utilisateur({
    this.id,
    required this.prenom,
    required this.nom,
    required this.email,
    required this.password,
    this.imagePath,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'prenom': prenom,
      'nom': nom,
      'email': email,
      'password': password,
      'imagePath': imagePath,
      'type': type,
    };
  }

  factory Utilisateur.fromMap(Map<String, dynamic> map) {
    return Utilisateur(
      id: map['id'],
      prenom: map['prenom'],
      nom: map['nom'],
      email: map['email'],
      password: map['password'],
      imagePath: map['imagePath'],
      type: map['type'],
    );
  }

  Utilisateur copyWith({
    String? id,
    String? prenom,
    String? nom,
    String? email,
    String? password,
    String? imagePath,
    String? type,
  }) {
    return Utilisateur(
      id: id ?? this.id,
      prenom: prenom ?? this.prenom,
      nom: nom ?? this.nom,
      email: email ?? this.email,
      password: password ?? this.password,
      imagePath: imagePath ?? this.imagePath,
      type: type ?? this.type,
    );
  }
}
