import 'package:bytebank/components/balance.dart';
import 'package:bytebank/components/operation_button.dart';
import 'package:bytebank/components/title_text.dart';
import 'package:bytebank/components/user.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  final List<Transfer> _transfers = [];
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _update(receivedTransfer) {
    if (receivedTransfer != null) {
      setState(() => widget._transfers.add(receivedTransfer));
    }
  }

  // _moveToTransactionPage() async {
  //   var receivedTransfer = const OperationButton(
  //     icon: Icons.transfer_within_a_station,
  //     text: 'Transfer',
  //     desiredRoute: '/transfer',
  //   );
  //   _update(receivedTransfer);
  // }

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
                  // TODO: Change this Logic
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          {
                            final Future future =
                                Navigator.pushNamed(context, '/transfer');
                            future.then(
                              (receivedTransfer) => _update(receivedTransfer),
                            );
                          }
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Color(0xfff3f3f3),
                                    offset: Offset(5, 5),
                                    blurRadius: 10)
                              ]),
                          child: const Icon(Icons.transfer_within_a_station),
                        ),
                      ),
                      Text('Transfer',
                          style: GoogleFonts.mulish(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff76797e))),
                    ],
                  ),
                  const OperationButton(
                    icon: Icons.perm_contact_cal,
                    text: 'Contacts',
                    desiredRoute: '/',
                  ),
                  const OperationButton(
                    icon: Icons.compare_arrows,
                    text: 'Transactions',
                    desiredRoute: '/',
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const TitleText(text: "Transactions"),
              const SizedBox(height: 20),
              Transfers(
                transfers: widget._transfers,
              )
            ],
          ),
        )),
      ),
    );
  }
}
