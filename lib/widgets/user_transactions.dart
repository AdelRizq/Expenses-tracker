import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Batee5a',
      amount: 9.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'socks',
      amount: 44.99,
      date: DateTime.now(),
    ),
  ];

  Function _addTransaction(String title, double amount) {
    setState(() {
      transactions.add(
        Transaction(
          id: 'tempId',
          title: title,
          amount: amount,
          date: DateTime.now(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTransaction),
        TransactionList(transactions),
      ],
    );
  }
}
