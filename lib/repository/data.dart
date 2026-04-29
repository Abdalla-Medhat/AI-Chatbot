import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLData {
  Database? _db;
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
    Database myDB = await openDatabase(fullPath, onCreate: _onCreate);
    return myDB;
  }

  //Create the database
  _onCreate(Database db, int version) async {
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
}
