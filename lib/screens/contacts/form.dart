import 'package:bytebank/components/editor.dart';
import 'package:bytebank/database/app_database.dart';
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
      final createdContact = ContactModel(0, name, accountNumber);
      saveContact(createdContact).then(
        (id) => Navigator.pop(context, id),
      );
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
          padding: const EdgeInsets.all(10),
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
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => _createTransfer(
                    context,
                    _controllerFieldName,
                  ),
                  child: const Text(_sendButton),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
