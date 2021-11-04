import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bytebank/database/app_database.dart';

class ContactDAO {
  static const String tableSQl = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<int> saveContact(ContactModel contact) async {
    final Database db = await getDatabase();
    return db.insert(
      _tableName,
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ContactModel>> findAllContacts() async {
    final Database db = await getDatabase();
    List<ContactModel> contacts = await _toList(db);
    return contacts;
  }

  Future<List<ContactModel>> _toList(Database db) async {
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    return List.generate(result.length, (index) {
      return ContactModel(
        result[index][_id],
        result[index][_name],
        result[index][_accountNumber],
      );
    });
  }
}
