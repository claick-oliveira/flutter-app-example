class Transfer {
  final double value;
  final int accountNumber;
  final DateTime time;

  Transfer(this.value, this.accountNumber, this.time);

  @override
  String toString() =>
      'Transfer{value: $value, accountNumber: $accountNumber, time: $time,}';

  double getValue() => value;
  int getAccountNumber() => accountNumber;
  DateTime getTime() => time;
}
