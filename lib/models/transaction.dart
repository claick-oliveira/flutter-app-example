class TransactionModel {
  static const String _value = 'value';
  static const String _accountNumber = 'account_number';
  static const String _time = 'time';

  final int id;
  final double value;
  final int accountNumber;
  final String time;

  TransactionModel(this.id, this.value, this.accountNumber, this.time);

  @override
  String toString() =>
      'Transaction{id: $id value: $value, accountNumber: $accountNumber, time: $time,}';

  int getId() => id;
  double getValue() => value;
  int getAccountNumber() => accountNumber;
  String getTime() => time;

  Map<String, dynamic> toMap() {
    return {
      _value: value,
      _accountNumber: accountNumber,
      _time: time,
    };
  }
}
