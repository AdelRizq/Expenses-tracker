import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;

  TransactionList(this._transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: _transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions yet!!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 250,
                  child: Image.asset('./assets/images/waiting.png',
                      fit: BoxFit.cover),
                )
              ],
            )
          : ListView.builder(
              // it renders just the viewed part of the list
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  elevation: 6,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text('\$${_transactions[index].amount}'),
                        ),
                      ),
                      radius: 30,
                    ),
                    title: Text(
                      _transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMd().format(_transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () =>
                          _deleteTransaction(_transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: _transactions.length,
            ),
    );
  }
}
