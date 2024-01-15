import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> _initDB() async {
    try {
      String path = join(await getDatabasesPath(), 'firstaid.db');
      print("Database Path: $path"); // This line prints the database path

      return openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
            CREATE TABLE user(
              user_id INTEGER PRIMARY KEY AUTOINCREMENT,
              password TEXT, 
              name TEXT,
              surname TEXT,
              email TEXT,
              phone_number TEXT,
              gender TEXT,
              age INTEGER,
              blood_type TEXT,
              rh_factor TEXT DEFAULT '+',
              points INTEGER DEFAULT 0
            );
          ''');
          await db.execute('''
            CREATE TABLE badges (
              badge_id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT UNIQUE NOT NULL
            );
          ''');
          await db.execute('''
            CREATE TABLE user_badges (
              user_id INTEGER,
              badge_id INTEGER,
              PRIMARY KEY (user_id, badge_id),
              FOREIGN KEY (user_id) REFERENCES user(user_id),
              FOREIGN KEY (badge_id) REFERENCES badges(badge_id)
            );
          ''');
          await db.execute('''
            CREATE TABLE articles (
              article_id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT NOT NULL,
              content TEXT NOT NULL,
              date_published DATE NOT NULL
            );
          ''');
          await db.execute('''
            CREATE TABLE user_articles (
              user_id INTEGER,
              article_id INTEGER,
              date_read DATETIME,
              PRIMARY KEY (user_id, article_id),
              FOREIGN KEY (user_id) REFERENCES user(user_id),
              FOREIGN KEY (article_id) REFERENCES articles(article_id)
            );
          ''');
          await db.execute('''
            CREATE TABLE medical_conditions (
              condition_id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL,
              description TEXT
            );
          ''');
          await db.execute('''
            CREATE TABLE user_conditions (
              user_id INTEGER,
              condition_id INTEGER,
              status TEXT NOT NULL,
              date_diagnosed DATE,
              date_resolved DATE,
              PRIMARY KEY (user_id, condition_id, status),
              FOREIGN KEY (user_id) REFERENCES user(user_id),
              FOREIGN KEY (condition_id) REFERENCES medical_conditions(condition_id)
            );
          ''');
          await db.execute('''
            CREATE TABLE allergies (
              allergy_id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL
            );
          ''');
          await db.execute('''
            CREATE TABLE user_allergies (
              user_id INTEGER,
              allergy_id INTEGER,
              PRIMARY KEY (user_id, allergy_id),
              FOREIGN KEY (user_id) REFERENCES user(user_id),
              FOREIGN KEY (allergy_id) REFERENCES allergies(allergy_id)
            );
          ''');
          await db.execute('''
            CREATE TABLE medications (
              medication_id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL,
              dosage TEXT
            );
          ''');
          await db.execute('''
            CREATE TABLE user_medications (
              user_id INTEGER,
              medication_id INTEGER,
              dosage TEXT,
              start_date DATE,
              end_date DATE,
              PRIMARY KEY (user_id, medication_id, start_date),
              FOREIGN KEY (user_id) REFERENCES user(user_id),
              FOREIGN KEY (medication_id) REFERENCES medications(medication_id)
            );
          ''');
        },
      );
    } catch (e) {
      print('Error initializing database: $e');
      rethrow;
    }
  }

  static Future<Database> get database => _initDB();

  // Example method to insert a user
  static Future<void> insertUser(Map<String, dynamic> userData) async {
    final Database db = await database;
    await db.insert(
      'user',
      userData,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Example method to retrieve all users
  static Future<List<Map<String, dynamic>>> getUsers() async {
    final Database db = await database;
    return db.query('user');
  }

  // Add more methods for CRUD operations on other tables
}
