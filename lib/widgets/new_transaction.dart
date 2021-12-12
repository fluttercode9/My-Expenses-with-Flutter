import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    // onChanged: (text) {
                      // titleInput = text;
                    // },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Price'),
                    controller: titleController,
                    // onChanged: (text) => amountInput = text,
                  ),
                  TextButton(
                    onPressed: () {

                    },
                    child: Text('Add Transaction'),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepOrange)),
                  ),
                ],
              ),
            ),
          );
  }
}