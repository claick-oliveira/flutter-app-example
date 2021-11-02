class Transfer {
  final int id;
  final double value;
  final int accountNumber;
  final DateTime time;

  Transfer(this.id, this.value, this.accountNumber, this.time);

  @override
  String toString() =>
      'Transfer{value: $value, accountNumber: $accountNumber, time: $time,}';

  double getValue() => value;
  int getAccountNumber() => accountNumber;
  DateTime getTime() => time;
}
