import 'package:bytebank/models/transaction.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bytebank/database/app_database.dart';

class TransactionDAO {
  Future<int> saveTransaction(TransactionModel transaction) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> transactionMap = {};
    transactionMap['value'] = transaction.value;
    transactionMap['account_number'] = transaction.accountNumber;
    transactionMap['time'] = transaction.time;
    return db.insert(
      'transactions',
      transactionMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<TransactionModel>> findAllTransactions() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('transactions');
    final List<TransactionModel> transactions = [];
    for (Map<String, dynamic> row in result) {
      final TransactionModel transaction = TransactionModel(
        row['id'],
        row['value'],
        row['account_number'],
        row['time'],
      );
      transactions.add(transaction);
    }
    return transactions;
  }
}
