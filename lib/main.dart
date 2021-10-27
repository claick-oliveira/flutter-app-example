import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: TransfersList(),
        appBar: AppBar(
          title: const Text('Transfers'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      debugShowCheckedModeBanner: true,
    ));

// ignore: use_key_in_widget_constructors
class TransfersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransferItem(Transfer(100.0, 1000)),
        TransferItem(Transfer(100.1, 1000)),
        TransferItem(Transfer(100.2, 1000)),
      ],
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
