import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import 'widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expenses',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.greenAccent,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   amount: 69.99,
    //   date: DateTime.now(),
    //   id: 't1',
    //   title: 'New Shoes',
    // ),
    // Transaction(
    //   amount: 489.99,
    //   date: DateTime.now(),
    //   id: 't2',
    //   title: 'New Bike',
    // ),
    // Transaction(
    //   amount: 69.99,
    //   date: DateTime.now(),
    //   id: 't3',
    //   title: 'New Shoes',
    // ),
    // Transaction(
    //   amount: 69.99,
    //   date: DateTime.now(),
    //   id: 't1',
    //   title: 'New Shoes',
    // ),
    // Transaction(
    //   amount: 489.99,
    //   date: DateTime.now(),
    //   id: 't2',
    //   title: 'New Bike',
    // ),
    // Transaction(
    //   amount: 69.99,
    //   date: DateTime.now(),
    //   id: 't3',
    //   title: 'New Shoes',
    // ),
    // Transaction(
    //   amount: 489.99,
    //   date: DateTime.now(),
    //   id: 't4',
    //   title: 'New Bike',
    // )
  ];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime chosenDate) {
    setState(() {
      _userTransactions.add(Transaction(
        amount: txAmount,
        date: chosenDate,
        title: txTitle,
        id: DateTime.now().toString(),
      ));
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }
  void _deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          )
        ],
        title: Text('My Expenses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions, _deleteTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
