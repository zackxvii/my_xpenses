import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_xpenses/controller/expenses_controller.dart';
import 'package:my_xpenses/model/expense_model.dart';
import 'package:my_xpenses/shared/input_field.dart';
import 'package:my_xpenses/util/theme.dart';
import 'package:my_xpenses/widgets/buttonWidget.dart';
import 'package:my_xpenses/widgets/customAppBar_Widget.dart';

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

  String _selectedDate = DateFormat.yMd().format(DateTime.now());
  String _startDate = DateFormat('hh:mm a').format(DateTime.now());
  String _endDate = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)));

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _reminderController = TextEditingController();
  final TextEditingController _repeatController = TextEditingController();

  int _selectedReminder = 5;
  List<int> reminderList = [5, 10, 15, 20];

  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];

  ExpensesController ex = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      appBar: CustomAppBar(
        leadingWidget: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Add Expenses",
                        style: TextStyle(
                            color: primaryClr,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InputField(
                    isEnabled: true,
                    hint: 'Enter Title',
                    label: 'Title',
                    iconOrdrop: 'icon',
                    controller: _titleController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                    isEnabled: true,
                    hint: 'Enter Note',
                    label: 'Note',
                    iconOrdrop: 'icon',
                    controller: _noteController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // InputField(
                  //   controller: _monthController,
                  //   isEnabled: false,
                  //   hint: 'Please Select Month',
                  //   label: 'Month',
                  //   iconOrdrop: 'drop',
                  //   widget: DropdownButton(
                  //     items: monthList
                  //         .map<DropdownMenuItem<String>>(
                  //           (value) => DropdownMenuItem<String>(
                  //             value: value.toString(),
                  //             child: Text(
                  //               value,
                  //               style: TextStyle(
                  //                   color: Get.isDarkMode
                  //                       ? Colors.white
                  //                       : Colors.black),
                  //             ),
                  //           ),
                  //         )
                  //         .toList(),
                  //     icon: const Icon(
                  //       Icons.keyboard_arrow_down,
                  //       color: Colors.grey,
                  //     ),
                  //     iconSize: 20,
                  //     underline: Container(
                  //       height: 0,
                  //     ),
                  //     onChanged: (String? newValue) {
                  //       setState(() {
                  //         _selectedReminder = int.parse(newValue!);
                  //         _reminderController.text =
                  //             _selectedReminder.toString();
                  //       });
                  //     },
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                    controller: _dateController,
                    isEnabled: false,
                    hint: _selectedDate.toString(),
                    label: 'Date',
                    iconOrdrop: 'button',
                    widget: IconButton(
                      icon: const Icon(Icons.date_range),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //_colorPallete(),
                      ButtonWidget(
                          label: 'Add Expenses',
                          onTap: () async {
                            // _submitOthers();
                            _submitDate();
                            _submitStartTime();
                            _submitEndTime();
                            if (_formKey.currentState!.validate()) {
                              final ExpenseModel em = ExpenseModel();
                              _addTaskToDB(em);
                              await ex.addExpenses(em);
                              Get.back();
                            }
                          },
                          color: primaryClr)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _addTaskToDB(ExpenseModel em) {
    em.title = _titleController.text;
    em.desc = _noteController.text;
    // em. = _selectedDate.toString();
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      currentDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    setState(() {
      if (selected != null) {
        _selectedDate = DateFormat.yMd().format(selected).toString();
      } else
        _selectedDate = DateFormat.yMd().format(DateTime.now()).toString();
    });
  }

  _submitDate() {
    _dateController.text = _selectedDate;
  }

  _selectStartTime(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    String formattedTime = selected!.format(context);
    setState(() {
      _startDate = formattedTime;
    });
  }

  _submitStartTime() {
    _startTimeController.text = _startDate;
  }

  _selectEndTime(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    String formattedTime = selected!.format(context);
    setState(() {
      _endDate = formattedTime;
    });
  }

  _submitEndTime() {
    _endTimeController.text = _endDate;
  }

  // _submitOthers() {
  //   if (_reminderController.text.isEmpty) {
  //     _reminderController.text = _selectedReminder.toString();
  //   }
  //   if (_repeatController.text.isEmpty) {
  //     _repeatController.text = _repeat.toString();
  //   }
  // }
}
