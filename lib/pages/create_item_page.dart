import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_xpenses/controller/item_controller.dart';
import 'package:my_xpenses/model/exp_list_model.dart';
import 'package:my_xpenses/shared/input_field.dart';
import 'package:my_xpenses/util/theme.dart';
import 'package:my_xpenses/widgets/buttonWidget.dart';
import 'package:my_xpenses/widgets/customAppBar_Widget.dart';

class CreateItemPage extends StatefulWidget {
  const CreateItemPage({super.key});

  @override
  State<CreateItemPage> createState() => _CreateItemPageState();
}

class _CreateItemPageState extends State<CreateItemPage> {
  final ItemController _itemController = Get.find();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _totalBudgetController = TextEditingController();
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
                    hint: 'Enter Item Name',
                    label: 'Item Name',
                    iconOrdrop: 'icon',
                    controller: _itemNameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                    isEnabled: true,
                    hint: 'Enter Note',
                    label: 'Description',
                    iconOrdrop: 'icon',
                    controller: _totalBudgetController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ButtonWidget(
                          label: 'Add Expenses',
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              final ExpenseListModel explist =
                                  ExpenseListModel();
                              _addItemToDB(explist);
                              await _itemController.addItem(explist);
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

  _addItemToDB(ExpenseListModel explist) {
    explist.itemName = _itemNameController.text;
    // explist.budget = double.parse(_totalBudgetController.text);
  }
}
