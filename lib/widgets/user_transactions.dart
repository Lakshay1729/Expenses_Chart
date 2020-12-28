import 'package:expenses_chart/widgets/new_transactions.dart';
import 'package:expenses_chart/widgets/trasaction_list.dart';
import 'package:flutter/material.dart';
import '../model/Transaction.dart';



class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> usertransactions=[
    Transaction(id: 't1',
      title: 'New Shoes',
      amount: 68.99,
      date: DateTime.now(),
    ),
    Transaction(id: 't2',
      title: 'Weekly Groceries',
      amount: 16.54,
      date: DateTime.now(),
    ),

  ];

  void _addNewTransaction(String title,double amount,DateTime date) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date:date ,
        id: DateTime.now().toString());
    setState(() {
      usertransactions.add(newTx);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction)
      ],
    );
  }
  }


