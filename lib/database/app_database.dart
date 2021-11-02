import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
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
      onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

Future<int> saveContact(ContactModel contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = {};
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert(
      'contacts',
      contactMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  });
}

Future<int> saveTransaction(TransactionModel transfer) {
  return createDatabase().then((db) {
    final Map<String, dynamic> transferMap = {};
    transferMap['value'] = transfer.value;
    transferMap['account_number'] = transfer.accountNumber;
    transferMap['time'] = transfer.time;
    return db.insert(
      'transactions',
      transferMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  });
}

Future<List<ContactModel>> findAllContacts() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<ContactModel> contacts = [];
      for (Map<String, dynamic> map in maps) {
        final ContactModel contact = ContactModel(
          map['id'],
          map['name'],
          map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}

Future<List<TransactionModel>> findAllTransactions() {
  return createDatabase().then((db) {
    return db.query('transactions').then((maps) {
      final List<TransactionModel> transactions = [];
      for (Map<String, dynamic> map in maps) {
        final TransactionModel transaction = TransactionModel(
          map['id'],
          map['value'],
          map['account_number'],
          map['time'],
        );
        transactions.add(transaction);
      }
      return transactions;
    });
  });
}
