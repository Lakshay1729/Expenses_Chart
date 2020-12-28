import 'package:expenses_chart/model/Transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/Transaction.dart';
import 'package:intl/intl.dart';
import '../widgets/user_transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> user_transactions;

  TransactionList(this.user_transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: user_transactions.isEmpty?Column(children:<Widget>[
        Text('No tranactions added yet',
          style:Theme.of(context).textTheme.title,
        ),
        SizedBox(height: 60,),
        Image.asset('assets/images/waiting.png',height: 300,fit:BoxFit.cover),
      ]):ListView.builder(
        itemBuilder: (ctx,index) {
          return
          Card(
          elevation: 9,
            color: Theme.of(context).backgroundColor,
            margin:EdgeInsets.symmetric(vertical:5,horizontal: 7),
            child: ListTile(
              leading: CircleAvatar(radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text(
                      "\$ ${user_transactions[index].amount.toStringAsFixed(
                          2)}",
                     ),)
                  ,),
              ),
              title: Text(
                  user_transactions[index].title,
                  style: Theme
                      .of(context)
                      .textTheme
                      .title
              ),
              subtitle: Text('${DateFormat.yMMMd().format(user_transactions[index].date)}'),
            ),);

        },
        itemCount: user_transactions.length,
    ),);
  }
}
