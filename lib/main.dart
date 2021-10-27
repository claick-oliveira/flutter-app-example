import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);
  static const String _title = 'Bytebank';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: NewTransferForm(),
      ),
      debugShowCheckedModeBanner: true,
    );
  }
}

// ignore: use_key_in_widget_constructors
class NewTransferForm extends StatelessWidget {
  final TextEditingController _controllerFieldAccountNumber =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Transfer'),
        ),
        body: Column(
          children: [
            Editor(
                controller: _controllerFieldAccountNumber,
                textLabel: 'Account Number',
                textHint: '0000',
                keyboardType: TextInputType.number),
            Editor(
                controller: _controllerFieldValue,
                textLabel: 'Value',
                textHint: '0.00',
                icon: Icons.monetization_on,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true)),
            ElevatedButton(
              onPressed: () => _createTransfer(
                  _controllerFieldAccountNumber, _controllerFieldValue),
              child: const Text('Send'),
            )
          ],
        ));
  }
}

void _createTransfer(_controllerFieldAccountNumber, _controllerFieldValue) {
  final int? accountNumber = int.tryParse(_controllerFieldAccountNumber.text);
  final double? value = double.tryParse(_controllerFieldValue.text);
  final createdTransfer = Transfer(value!, accountNumber!);
  debugPrint('$createdTransfer');
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String textLabel;
  final String textHint;
  final TextInputType keyboardType;
  final IconData? icon;

  const Editor({
    Key? key,
    required this.controller,
    required this.textLabel,
    required this.textHint,
    required this.keyboardType,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: textLabel,
            hintText: textHint,
            icon: icon != null
                ? Icon(
                    icon,
                    size: 50.0,
                  )
                : null),
        style: const TextStyle(fontSize: 24.0),
        keyboardType: keyboardType,
        controller: controller,
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class TransfersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfers'),
      ),
      body: Column(
        children: [
          TransferItem(Transfer(100.0, 1000)),
          TransferItem(Transfer(100.1, 1000)),
          TransferItem(Transfer(100.2, 1000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      // ignore: prefer_const_constructors
      leading: Icon(
        Icons.monetization_on,
        size: 62.0,
      ),
      title: Text(_transfer.value.toString()),
      subtitle: Text(_transfer.accountNumber.toString()),
    ));
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);

  @override
  String toString() {
    return 'Transfer{value: $value, accountNumber: $accountNumber}';
  }
}
