class ContactModel {
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';
  final int id;
  final String name;
  final int accountNumber;

  ContactModel(this.id, this.name, this.accountNumber);

  @override
  String toString() =>
      'Contact{id: $id, name: $name, accountNumber: $accountNumber}';

  int getId() => id;
  String getName() => name;
  int getAccountNumber() => accountNumber;

  Map<String, dynamic> toMap() {
    return {
      _id: id,
      _name: name,
      _accountNumber: accountNumber,
    };
  }
}
