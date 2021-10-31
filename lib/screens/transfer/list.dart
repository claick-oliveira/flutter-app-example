import 'package:bytebank/components/transfer_item.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class Transfers extends StatefulWidget {
  final List<Transfer> transfers;

  const Transfers({Key? key, required this.transfers}) : super(key: key);

  @override
  State<Transfers> createState() => _TransfersState();
}

class _TransfersState extends State<Transfers> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.transfers.length,
      itemBuilder: (context, index) {
        final transfer = widget.transfers[index];
        debugPrint('$transfer');
        return const TransferItem(
          text: 'Teste',
          time: '10:00',
        );
      },
    );
  }
}
