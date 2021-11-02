import 'package:bytebank/components/balance.dart';
import 'package:bytebank/components/operation_button.dart';
import 'package:bytebank/components/title_text.dart';
import 'package:bytebank/components/user.dart';
import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final List _transfers = [];
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _transferRoute(context, desiredRoute) async {
    final result = await Navigator.pushNamed(context, desiredRoute);
    // ignore: avoid_print
    if (result != null) {
      widget._transfers.add(result);
    }
    setState(() {});
  }

  void _nextRoute(context, desiredRoute) {
    Navigator.pushNamed(context, desiredRoute);
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
                  OperationButton(
                    icon: Icons.compare_arrows,
                    text: 'Transactions',
                    onMyTap: () {
                      _nextRoute(context, '/');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const TitleText(text: "Transactions"),
              const SizedBox(height: 20),
              TransferList(
                transfers: widget._transfers,
              )
            ],
          ),
        )),
      ),
    );
  }
}
