import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widget/new_expense.dart';
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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpenses(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _regiseredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _regiseredExpenses.indexOf(expense);
    setState(() {
      _regiseredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense Deleted..!'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _regiseredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        const Center(child: Text(' No Expense Found. Start Adding some!'));

    if (_regiseredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _regiseredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker'), actions: [
        IconButton(
          onPressed: _openAddExpenseOverlay,
          icon: const Icon(Icons.add),
        )
      ]),
      body: Column(
        children: [const Text('The Chart'), Expanded(child: mainContent)],
      ),
    );
  }
}
