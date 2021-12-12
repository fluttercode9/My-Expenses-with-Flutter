import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      amount: 69.99,
      date: DateTime.now(),
      id: 't1',
      title: 'New Shoes',
    ),
    Transaction(
      amount: 489.99,
      date: DateTime.now(),
      id: 't2',
      title: 'New Bike',
    )
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    setState(() {
      _userTransactions.add(Transaction(
        amount: txAmount,
        date: DateTime.now(),
        title: txTitle,
        id: DateTime.now().toString(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        TransactionList(_userTransactions),
      ],
    );
  }
}
