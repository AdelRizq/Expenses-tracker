import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double percentAmountOfTotal;

  ChartBar({this.label, this.spendingAmount, this.percentAmountOfTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(this.label),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentAmountOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          height: 20,
          child: FittedBox(
            child: Text(
              '\$${this.spendingAmount.toStringAsFixed(0)}',
            ),
          ),
        ),
      ],
    );
  }
}
