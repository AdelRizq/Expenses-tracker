import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.tealAccent[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
        ),
      ),
      home: MyHomePageState(),
    );
  }
}

class MyHomePageState extends StatefulWidget {
  @override
  _MyHomePageStateState createState() => _MyHomePageStateState();
}

class _MyHomePageStateState extends State<MyHomePageState> {
  final List<Transaction> transactions = [
    Transaction(
      id: 't2',
      title: 'cheetos',
      amount: 4.99,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 't3',
      title: 'coffee',
      amount: 34.99,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: 't1',
      title: 'popcorn',
      amount: 9.99,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
  ];

  void _addTransaction(String title, double amount) {
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

  List<Transaction> get _recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _openAddNewTransactionForm(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personal expenses",
          style: Theme.of(context).appBarTheme.textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openAddNewTransactionForm(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () => _openAddNewTransactionForm(context),
      ),
    );
  }
}
