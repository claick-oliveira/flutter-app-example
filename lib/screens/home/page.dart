import 'package:bytebank/components/balance.dart';
import 'package:bytebank/components/operation_button.dart';
import 'package:bytebank/components/title_text.dart';
import 'package:bytebank/components/transaction_item.dart';
import 'package:bytebank/components/user.dart';
import 'package:bytebank/database/dao/transaction_dao.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TransactionDAO _dao = TransactionDAO();

  void _transferRoute(context, desiredRoute) async {
    final result = await Navigator.pushNamed(context, desiredRoute);
    if (result != null) {
      setState(() {});
      const snackBar = SnackBar(
        content: Text('Transaction Added!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _nextRoute(context, desiredRoute) {
    Navigator.pushNamed(context, desiredRoute);
  }

  _transferList() {
    return FutureBuilder<List<TransactionModel>>(
      initialData: const [],
      future: _dao.findAllTransactions(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
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
            final transactions = snapshot.data;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: transactions?.length ?? 0,
              itemBuilder: (context, index) {
                final transaction = transactions![index];
                return TransferItem(
                  text: transaction.getAccountNumber().toString(),
                  time: DateFormat.yMMMMd()
                      .add_jm()
                      .format(DateTime.parse(transaction.getTime()))
                      .toString(),
                  value: transaction.getValue().toString(),
                );
              },
            );
        }
        return const Text('Unknow error');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              const User(),
              const SizedBox(height: 40),
              const TitleText(text: "My wallet"),
              const SizedBox(height: 20),
              const BalanceCard(),
              const SizedBox(height: 50),
              const TitleText(text: "Operations"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OperationButton(
                    icon: Icons.transfer_within_a_station,
                    text: 'Transfer',
                    onMyTap: () {
                      _transferRoute(context, '/transfer');
                    },
                  ),
                  OperationButton(
                    icon: Icons.perm_contact_cal,
                    text: 'Contacts',
                    onMyTap: () {
                      _nextRoute(context, '/contacts');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const TitleText(text: "Transactions"),
              const SizedBox(height: 20),
              _transferList(),
            ],
          ),
        )),
      ),
    );
  }
}
