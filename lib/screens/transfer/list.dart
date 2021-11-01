import 'package:bytebank/components/transfer_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransferList extends StatelessWidget {
  final List transfers;
  const TransferList({Key? key, required this.transfers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: transfers.length,
      itemBuilder: (context, index) {
        final transfer = transfers[index];
        return TransferItem(
          text: transfer.getAccountNumber().toString(),
          time: DateFormat.yMMMMd()
              .add_jm()
              .format(transfer.getTime())
              .toString(),
          value: transfer.getValue().toString(),
        );
      },
    );
  }
}
