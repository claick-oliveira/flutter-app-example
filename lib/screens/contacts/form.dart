import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

const _name = 'Name';
const _accountNumber = 'Account Number';
const _accountNumberHint = '00000';
const _sendButton = 'Send';

class NewContactForm extends StatelessWidget {
  NewContactForm({Key? key}) : super(key: key);
  final TextEditingController _controllerFieldName = TextEditingController();
  final TextEditingController _controllerFieldAccountNumber =
      TextEditingController();

  void _createTransfer(context, _controllerFieldName) {
    final String? name = _controllerFieldName.text;
    final int? accountNumber = int.tryParse(_controllerFieldAccountNumber.text);
    if (name != null && accountNumber != null) {
      final createdContact = Contact(name, accountNumber);
      Navigator.pop(context, createdContact);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Editor(
                controller: _controllerFieldName,
                textLabel: _name,
                textHint: '',
                keyboardType: TextInputType.name,
              ),
              Editor(
                controller: _controllerFieldAccountNumber,
                textLabel: _accountNumber,
                textHint: _accountNumberHint,
                keyboardType: TextInputType.name,
              ),
              ElevatedButton(
                onPressed: () => _createTransfer(
                  context,
                  _controllerFieldName,
                ),
                child: const Text(_sendButton),
              )
            ],
          ),
        ),
      ),
    );
  }
}
