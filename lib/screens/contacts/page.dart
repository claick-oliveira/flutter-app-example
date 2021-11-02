import 'package:bytebank/components/contact.dart';
import 'package:bytebank/components/title_text.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  final List _contacts = [];
  ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  void _formRoute(context, desiredRoute) async {
    final result = await Navigator.pushNamed(context, desiredRoute);
    // ignore: avoid_print
    if (result != null) {
      widget._contacts.add(result);
    }
    setState(() {});
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
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleText(text: "Contacts"),
                const SizedBox(height: 30),
                ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget._contacts.length,
                  itemBuilder: (context, index) {
                    final contact = widget._contacts[index];
                    return ContactCard(
                      name: contact.getName(),
                      accountNumber: contact.getAccountNumber(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () => _formRoute(context, '/newContact'),
            heroTag: null,
            backgroundColor: Colors.blue.shade200,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
