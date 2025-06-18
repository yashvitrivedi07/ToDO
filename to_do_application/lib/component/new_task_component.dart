import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_application/component/priority_dialog_component.dart';
import 'package:to_do_application/controller/navigation_controller.dart';
import 'package:to_do_application/controller/todo_controller.dart';
import 'package:to_do_application/modal/todo_modal.dart';

// ignore: must_be_immutable
class NewTaskComponent extends StatefulWidget {
  NewTaskComponent({super.key});

  @override
  State<NewTaskComponent> createState() => _NewTaskComponentState();
}

class _NewTaskComponentState extends State<NewTaskComponent> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  NavigationController controller = Get.find<NavigationController>(tag: 'nav');

  TodoController todoController = Get.put(TodoController());

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
      height: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Add Task",
              style: TextStyle(fontSize: 20.sp),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                hintText: "Description",
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2070),
                    initialDate: DateTime.now(),
                    keyboardType: TextInputType.datetime,
                    barrierColor: Colors.transparent,
                    barrierDismissible: true,
                  );
                  if (selectedDate != null) {
                    controller.date.value =
                        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                  }
                },
                icon: Icon(Icons.watch),
              ),
              Obx(() => Text(
                    controller.date.value,
                    style: TextStyle(color: Colors.white),
                  )),
              IconButton(onPressed: () {}, icon: Icon(Icons.app_blocking)),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return PriorityDialogComponent();
                    },
                  );
                },
                icon: Icon(Icons.flag),
              ),
              SizedBox(width: 70.w),
              IconButton(
                onPressed: () {
                  controller.isEmpty.value = false;
                  TimeOfDay time = TimeOfDay.now();
                  TodoModal modal = TodoModal(
                    toid: 0,
                    title: titleController.text,
                    description: descriptionController.text,
                    date: controller.date.value,
                    time: "${time.hour}:${time.minute}",
                    priority: controller.priority.value,
                    type: controller.type.value,
                  );
                  todoController.addData(modal);
                },
                icon: Icon(Icons.next_plan),
              ),
            ],
          )
        ],
      ),
    );
  }
}
