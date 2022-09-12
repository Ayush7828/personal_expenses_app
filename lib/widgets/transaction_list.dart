import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // TransactionList({super.key});
  final List<Transaction> transactions;
  final Function _deleteTx;
  const TransactionList(this.transactions, this._deleteTx, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              const Text(
                "No transaction added yet!",
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12.0,
              ),
              SizedBox(
                  height: 200,
                  child: Image.asset(
                    "assets/images/wa.png",
                    fit: BoxFit.fill,
                  ))
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 7.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 32.0,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: FittedBox(
                        child: Text('\$${transactions[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: const TextStyle(
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: const TextStyle(
                        fontFamily: "Poppins", fontWeight: FontWeight.w700),
                  ),
                  trailing: IconButton(
                      onPressed: () => _deleteTx(transactions[index].id),
                      icon: Icon(
                        Icons.delete,
                        size: 30.0,
                        color: Theme.of(context).errorColor,
                      )),
                ),
              );
            },
            itemCount: transactions.length,
            // children: transactions.map((tx) {
            // );
            // }).toList(),
          );
  }
}
