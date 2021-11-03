import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
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

Future<int> saveContact(ContactModel contact) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contactMap = {};
  contactMap['name'] = contact.name;
  contactMap['account_number'] = contact.accountNumber;
  return db.insert(
    'contacts',
    contactMap,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

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

Future<List<ContactModel>> findAllContacts() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('contacts');
  final List<ContactModel> contacts = [];
  for (Map<String, dynamic> row in result) {
    final ContactModel contact = ContactModel(
      row['id'],
      row['name'],
      row['account_number'],
    );
    contacts.add(contact);
  }
  return contacts;
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
