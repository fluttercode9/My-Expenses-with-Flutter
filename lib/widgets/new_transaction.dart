import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _SelectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    final enteredDate = _SelectedDate;
    if (enteredAmount <= 0 || enteredTitle.isEmpty || _SelectedDate == null ){
      print('it works');
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      enteredDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      _SelectedDate = pickedDate;
      setState(() {});
    });
  }

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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (text) {
              // titleInput = text;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (text) => amountInput = text,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_SelectedDate == null
                        ? 'No Date Chosen!'
                        : 'picked date: ' +
                            DateFormat.yMd().format(_SelectedDate)),
                  ),
                  TextButton(
                      onPressed: _presentDatePicker,
                      child: Text('Choose Date',
                          style: TextStyle(fontWeight: FontWeight.bold)))
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
