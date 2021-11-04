import 'package:bytebank/models/transaction.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bytebank/database/app_database.dart';

class TransactionDAO {
  static const String tableSQl = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$_value REAL, '
      '$_accountNumber INTEGER, '
      '$_time TEXT)';
  static const String _tableName = 'transactions';
  static const String _id = 'id';
  static const String _value = 'value';
  static const String _accountNumber = 'account_number';
  static const String _time = 'time';

  Future<int> saveTransaction(TransactionModel transaction) async {
    final Database db = await getDatabase();
    return db.insert(
      _tableName,
      transaction.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<TransactionModel>> findAllTransactions() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    return List.generate(result.length, (index) {
      return TransactionModel(
        result[index][_id],
        result[index][_value],
        result[index][_accountNumber],
        result[index][_time],
      );
    });
  }
}
