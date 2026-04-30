import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLData {
  static Database? _db;
  //retrieve the database
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initializeDB();
      return _db;
    }
    return _db;
  }

  //Initialize the database
  initializeDB() async {
    String path = await getDatabasesPath();
    String fullPath = join(path, "chatbot.db");
    Database myDB = await openDatabase(
      fullPath,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      version: 1,
    );
    return myDB;
  }

  //Create the database
  FutureOr<void> _onCreate(Database db, int version) async {
    db.execute("""
  Create Table `users` (id INTEGER PRIMARY KEY AUTOINCREMENT,
  `EMAIL` TEXT NOT NULL,
  `PASSWORD` TEXT NOT NULL,
  `USER_NAME` TEXT DEFAULT "User",
  `CONVERSATION` TEXT ,
  UNIQUE(EMAIL))
""");
    print("Database Created Successfully =======================>>");
  }

  //onUpgrade the database
  FutureOr<void> _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {}
}
