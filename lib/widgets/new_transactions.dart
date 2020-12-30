import 'package:expenses_chart/widgets/adaptive_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function transaction_Handler;

  NewTransaction(this.transaction_Handler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    final enteredDate = _selectedDate;
    if (enteredTitle.isEmpty || enteredAmount <= 0 || enteredDate == null) {
      return;
    }
    widget.transaction_Handler(enteredTitle, enteredAmount, enteredDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    }).whenComplete(() {
      _submitData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Input your expenses',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'OpenSans'),
                      textWidthBasis: TextWidthBasis.longestLine,
                    ),
                  ]),
              SizedBox(
                height: 8,
              ),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                    labelText: 'Title', border: OutlineInputBorder()),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                    labelText: 'Amount', border: OutlineInputBorder()),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No date Chosen'
                          : 'Picked Date :${DateFormat.yMMMd().format(_selectedDate)}'),
                    ),
                    AdaptiveFlatButton('Choose Date', _presentDatePicker)
                  ],
                ),
              ),
              RaisedButton(
                  child: Text(
                    'Add Transaction',
                  ),
                  textColor: Theme.of(context).textTheme.button.color,
                  color: Theme.of(context).primaryColor,
                  onPressed: _submitData),
            ],
          ),
        ),
      ),
    );
  }
}
