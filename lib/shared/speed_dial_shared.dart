import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:my_xpenses/sql/database_helper.dart';

class SpeedDialWidget extends StatefulWidget {
  const SpeedDialWidget({super.key});

  @override
  State<SpeedDialWidget> createState() => _SpeedDialWidgetState();
}

class _SpeedDialWidgetState extends State<SpeedDialWidget> {
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var mini = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);

  DatabaseHelper mydb = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Colors.cyan,
      icon: Icons.add,
      activeIcon: Icons.close,
      spacing: 3,
      mini: mini,
      openCloseDial: isDialOpen,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      dialRoot: customDialRoot
          ? (ctx, open, toggleChildren) {
              return ElevatedButton(
                onPressed: toggleChildren,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                ),
                child: const Text(
                  "Custom Dial Root",
                  style: TextStyle(fontSize: 17),
                ),
              );
            }
          : null,
      buttonSize: buttonSize,
      label: extend ? const Text("Open") : null,
      activeLabel: extend ? const Text("Close") : null,
      childrenButtonSize: childrenButtonSize,
      visible: visible,
      direction: speedDialDirection,
      switchLabelPosition: switchLabelPosition,
      closeManually: closeManually,
      renderOverlay: renderOverlay,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () {
        setState(() {});
      },
      useRotationAnimation: useRAnimation,
      tooltip: 'Open Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      elevation: 8.0,
      animationCurve: Curves.elasticInOut,
      isOpenOnStart: false,
      shape: customDialRoot
          ? const RoundedRectangleBorder()
          : const StadiumBorder(),
      children: [
        SpeedDialChild(
          child: !rmicons ? const Icon(Icons.brush) : null,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          label: 'Add New Expenses',
          onTap: () {
            showDialogWithFields();
            setState(() {
              mydb.open();
            });
          },
          onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: !rmicons ? const Icon(Icons.accessibility_new) : null,
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          label: 'Coming Soon!',
          onTap: () => debugPrint('SECOND CHILD'),
        ),
      ],
    );
  }

  showDialogWithFields() {
    return showDialog(
      context: context,
      builder: (_) {
        var monthController = TextEditingController();
        var descriptionController = TextEditingController();
        return AlertDialog(
          title: const Text('New Tracking'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: monthController,
                  decoration: const InputDecoration(hintText: 'Month'),
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(hintText: 'Description'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Send them to your email maybe?
                var month = monthController.text;
                var desc = descriptionController.text;
                mydb.db.rawInsert(
                    "INSERT INTO expenses (month, description) VALUES (?, ?);",
                    [month, desc]);

                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("New Expenses Added")));

                monthController.text = "";
                descriptionController.text = "";
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

extension EnumExt on FloatingActionButtonLocation {
  String get value => toString().split(".")[1];
}
