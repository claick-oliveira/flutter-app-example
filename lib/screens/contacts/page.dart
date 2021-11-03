import 'package:bytebank/components/contact.dart';
import 'package:bytebank/components/title_text.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final ContactDAO _dao = ContactDAO();

  void _formRoute(context, desiredRoute) async {
    final result = await Navigator.pushNamed(context, desiredRoute);
    if (result != null) {
      const snackBar = SnackBar(
        content: Text('Contact Added!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {});
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
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleText(text: "Contacts"),
                const SizedBox(height: 30),
                FutureBuilder<List<ContactModel>>(
                  initialData: const [],
                  // Delay example to test CircularProgressIndicator()
                  //future: Future.delayed(const Duration(seconds: 2)).then(
                  //  (value) => findAllContacts(),
                  //)
                  future: _dao.findAllContacts(),
                  builder:
                      (BuildContext context, AsyncSnapshot<List> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        break;
                      case ConnectionState.waiting:
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.70,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(),
                                SizedBox(height: 10),
                                TitleText(
                                  text: 'Loading',
                                  fontSize: 15,
                                )
                              ],
                            ),
                          ),
                        );
                      case ConnectionState.active:
                        break;
                      case ConnectionState.done:
                        final contacts = snapshot.data;
                        return ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: contacts?.length ?? 0,
                          itemBuilder: (context, index) {
                            final contact = contacts?[index];
                            return ContactCard(
                              name: contact.getName(),
                              accountNumber: contact.getAccountNumber(),
                            );
                          },
                        );
                    }
                    return const Text('Unknow error');
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
