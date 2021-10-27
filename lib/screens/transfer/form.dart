import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

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
    if (value != null && accountNumber != null) {
      final createdTransfer = Transfer(value, accountNumber);
      debugPrint('Creating new transfer');
      debugPrint('$createdTransfer');
      Navigator.pop(context, createdTransfer);
    }
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
