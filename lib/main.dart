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
        body: TransfersList(),
      ),
      debugShowCheckedModeBanner: true,
    );
  }
}

class NewTransferForm extends StatefulWidget {
  const NewTransferForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NewTransferFormState();
  }
}

class NewTransferFormState extends State<NewTransferForm> {
  final TextEditingController _controllerFieldAccountNumber =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  void _createTransfer(
      context, _controllerFieldAccountNumber, _controllerFieldValue) {
    final int? accountNumber = int.tryParse(_controllerFieldAccountNumber.text);
    final double? value = double.tryParse(_controllerFieldValue.text);
    final createdTransfer = Transfer(value!, accountNumber!);
    debugPrint('Creating new transfer');
    debugPrint('$createdTransfer');
    Navigator.pop(context, createdTransfer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Transfer'),
        ),
        body: SingleChildScrollView(
            child: Column(
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
              onPressed: () => _createTransfer(context,
                  _controllerFieldAccountNumber, _controllerFieldValue),
              child: const Text('Send'),
            )
          ],
        )));
  }
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

class TransfersList extends StatefulWidget {
  TransfersList({Key? key}) : super(key: key);

  final List<Transfer> _transfers = [];

  @override
  State<StatefulWidget> createState() => TransferListState();
}

class TransferListState extends State<TransfersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfers'),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const NewTransferForm();
          }));
          future.then((receivedTransfer) {
            Future.delayed(const Duration(seconds: 1), () {
              debugPrint('New transfer received');
              debugPrint('$receivedTransfer');
              if (receivedTransfer != null) {
                setState(() {
                  widget._transfers.add(receivedTransfer);
                });
              }
            });
          });
        },
        icon: const Icon(Icons.add),
        label: const Text('Add'),
        tooltip: 'Click to Add',
        elevation: 6,
        hoverElevation: 20,
        splashColor: Colors.blueGrey,
        highlightElevation: 20,
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  const TransferItem(this._transfer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: const Icon(
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
