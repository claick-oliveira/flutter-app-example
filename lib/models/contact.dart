class ContactModel {
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
}
