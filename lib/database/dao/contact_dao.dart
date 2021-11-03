import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bytebank/database/app_database.dart';

class ContactDAO {
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
}
