import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:flutter/material.dart';

const _title = 'Transfers';
const _label = 'Add';
const _buttonTip = 'Click to Add';

class TransfersList extends StatefulWidget {
  TransfersList({Key? key}) : super(key: key);

  final List<Transfer> _transfers = [];

  @override
  State<StatefulWidget> createState() => TransferListState();
}

class TransferListState extends State<TransfersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final Future future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewTransferForm()),
          );
          future.then((receivedTransfer) => _update(receivedTransfer));
        },
        icon: const Icon(Icons.add),
        label: const Text(_label),
        tooltip: _buttonTip,
        elevation: 6,
        hoverElevation: 20,
        splashColor: Colors.blueGrey,
        highlightElevation: 20,
      ),
    );
  }

  void _update(receivedTransfer) {
    if (receivedTransfer != null) {
      setState(() => widget._transfers.add(receivedTransfer));
    }
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  const TransferItem(this._transfer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.monetization_on,
          size: 62.0,
        ),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}
