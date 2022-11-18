import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_xpenses/controller/expenses_controller.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final ExpensesController _expensesController = Get.find();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  List<String> monthList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
