import 'package:bytebank/screens/contacts/form.dart';
import 'package:bytebank/screens/contacts/page.dart';
import 'package:bytebank/screens/home/page.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);
  static const String _title = 'Bytebank';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/transfer': (context) => NewTransferForm(),
        '/contacts': (context) => const ContactList(),
        '/newContact': (context) => NewContactForm(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
