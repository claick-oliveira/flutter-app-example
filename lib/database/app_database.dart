import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(
        'CREATE TABLE contacts('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'name TEXT, '
        'account_number INTEGER)',
      );
      db.execute(
        'CREATE TABLE transactions('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'value REAL, '
        'account_number INTEGER, '
        'time TEXT)',
      );
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}
