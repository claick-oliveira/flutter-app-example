import 'package:bytebank/components/editor.dart';
import 'package:bytebank/database/dao/transaction_dao.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';

const _accountNumber = 'Account Number';
const _accountHint = '0000';
const _value = 'Value';
const _valueHint = '0.00';
const _sendButton = 'Send';

class NewTransactionForm extends StatelessWidget {
  NewTransactionForm({Key? key}) : super(key: key);
  final TextEditingController _controllerFieldAccountNumber =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();
  final TransactionDAO _dao = TransactionDAO();

  void _createTransfer(
      context, _controllerFieldAccountNumber, _controllerFieldValue) {
    final int? accountNumber = int.tryParse(_controllerFieldAccountNumber.text);
    final double? value = double.tryParse(_controllerFieldValue.text);
    if (value != null && accountNumber != null) {
      DateTime now = DateTime.now();
      final createdTransaction =
          TransactionModel(0, value, accountNumber, now.toString());
      _dao.saveTransaction(createdTransaction).then(
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
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => _createTransfer(
                    context,
                    _controllerFieldAccountNumber,
                    _controllerFieldValue,
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
