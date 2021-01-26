import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionsPerDays {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalAmount = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year)
          totalAmount += recentTransactions[i].amount;
      }

      return {
        'day': DateFormat.E().format(weekday),
        'amount': totalAmount,
      };
    }).reversed.toList();
  }

  double get totalAmount {
    return recentTransactions.fold(
      0.0,
      (sum, tx) {
        return sum + tx.amount;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionsPerDays.map(
            (tx) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: tx['day'],
                  spendingAmount: tx['amount'],
                  percentAmountOfTotal: totalAmount == 0.0
                      ? 0.0
                      : (tx['amount'] as double) / totalAmount,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
