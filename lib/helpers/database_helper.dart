import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'rent_it.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE utilisateurs(
        id INTEGER PRIMARY KEY,
        prenom TEXT,
        nom TEXT,
        email TEXT,
        password TEXT,
        image_path TEXT,
        type TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE logements(
        id INTEGER PRIMARY KEY,
        name TEXT,
        adresse TEXT,
        typeLogement TEXT,
        nombreChambres INTEGER,
        prix REAL,
        imagePath TEXT,
        description TEXT,
        status TEXT,
        area REAL,
        beds INTEGER,
        baths INTEGER,
        garage INTEGER,
        city TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE location_orders(
        id INTEGER PRIMARY KEY,
        userId INTEGER,
        logementId INTEGER,
        status TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE commentaires(
        num INTEGER PRIMARY KEY,
        userId INTEGER,
        commentaire TEXT,
        dateCommentaire TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE logement_images(
        id INTEGER PRIMARY KEY,
        logementId INTEGER,
        imagePath TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE logement_amenities(
        id INTEGER PRIMARY KEY,
        logementId INTEGER,
        amenity TEXT
      )
    ''');
  }
}
