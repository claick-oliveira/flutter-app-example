import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _title = 'New Transfer';
const _accountNumber = 'Account Number';
const _accountHint = '0000';
const _value = 'Value';
const _valueHint = '0.00';
const _sendButton = 'Send';

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
      Navigator.pop(context, createdTransfer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controller: _controllerFieldAccountNumber,
                textLabel: _accountNumber,
                textHint: _accountHint,
                keyboardType: TextInputType.number),
            Editor(
                controller: _controllerFieldValue,
                textLabel: _value,
                textHint: _valueHint,
                icon: Icons.monetization_on,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true)),
            ElevatedButton(
              onPressed: () => _createTransfer(
                context,
                _controllerFieldAccountNumber,
                _controllerFieldValue,
              ),
              child: const Text(_sendButton),
            )
          ],
        ),
      ),
    );
  }
}
