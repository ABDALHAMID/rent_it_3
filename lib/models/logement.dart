class Logement {
  String? id;
  String name;
  String adresse;
  String typeLogement;
  int? nombreChambres;
  double prix;
  String? imagePath;
  String description;
  String status;
  double area;
  int beds;
  int baths;
  int garage;
  String city;

  Logement({
    this.id,
    required this.name,
    required this.adresse,
    required this.typeLogement,
    this.nombreChambres,
    required this.prix,
    this.imagePath,
    required this.description,
    required this.status,
    required this.area,
    required this.beds,
    required this.baths,
    required this.garage,
    required this.city,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'adresse': adresse,
      'typeLogement': typeLogement,
      'nombreChambres': nombreChambres,
      'prix': prix,
      'imagePath': imagePath,
      'description': description,
      'status': status,
      'area': area,
      'beds': beds,
      'baths': baths,
      'garage': garage,
      'city': city,
    };
  }

  factory Logement.fromMap(Map<String, dynamic> map) {
    return Logement(
      id: map['id'],
      name: map['name'],
      adresse: map['adresse'],
      typeLogement: map['typeLogement'],
      nombreChambres: map['nombreChambres'],
      prix: map['prix'],
      imagePath: map['imagePath'],
      description: map['description'],
      status: map['status'],
      area: map['area'],
      beds: map['beds'],
      baths: map['baths'],
      garage: map['garage'],
      city: map['city'],
    );
  }

  // Add the copyWith method
  Logement copyWith({
    String? id,
    String? name,
    String? adresse,
    String? typeLogement,
    int? nombreChambres,
    double? prix,
    String? imagePath,
    String? description,
    String? status,
    double? area,
    int? beds,
    int? baths,
    int? garage,
    String? city,
  }) {
    return Logement(
      id: id ?? this.id,
      name: name ?? this.name,
      adresse: adresse ?? this.adresse,
      typeLogement: typeLogement ?? this.typeLogement,
      nombreChambres: nombreChambres ?? this.nombreChambres,
      prix: prix ?? this.prix,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
      status: status ?? this.status,
      area: area ?? this.area,
      beds: beds ?? this.beds,
      baths: baths ?? this.baths,
      garage: garage ?? this.garage,
      city: city ?? this.city,
    );
  }
}
