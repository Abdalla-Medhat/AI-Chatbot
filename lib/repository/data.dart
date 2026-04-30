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
  //Select data from the database
  Future<List<Map<String, Object?>>> readData(String sql) async {
    Database? myDB = await db;
    List<Map<String, Object?>> response = await myDB!.rawQuery(sql);
    return response;
  }

  //Insert data into the database
  Future<int> insertData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawInsert(sql);
    return response;
  }
}
