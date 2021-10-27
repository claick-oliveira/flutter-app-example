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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Transfer'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Account Number', hintText: '0000'),
                style: TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.monetization_on,
                      size: 50.0,
                    ),
                    labelText: 'Value',
                    hintText: '0.00'),
                style: TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Send'),
            )
          ],
        ));
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
}
