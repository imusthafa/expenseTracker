import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _regiseredExpenses = [
    Expense(
        title: 'FlutterCourese',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Cinema',
        amount: 69.99,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'ooty',
        amount: 339.99,
        date: DateTime.now(),
        category: Category.travel)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(
              child: ExpenseList(
            expenses: _regiseredExpenses,
          ))
        ],
      ),
    );
  }
}
