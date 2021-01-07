import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final addTransaction;

  NewTransaction(this.addTransaction);

  void submitData() {
    final String titleInput = titleController.text;
    final double amountInput = double.parse(amountController.text);

    if (titleInput.isEmpty || amountInput <= 0) return;

    addTransaction(titleInput, amountInput);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (val) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (val) => submitData(),
            ),
            FlatButton(
              child: Text('Add transaction'),
              color: Colors.teal,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
