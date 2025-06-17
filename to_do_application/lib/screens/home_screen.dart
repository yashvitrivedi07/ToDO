import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_application/component/calendar_component.dart';
import 'package:to_do_application/component/index_component.dart';
import 'package:to_do_application/component/new_task_component.dart';
import 'package:to_do_application/component/focus.dart';
import 'package:to_do_application/component/task_component.dart';
import 'package:to_do_application/controller/navigation_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController controller = Get.put(NavigationController(),tag: 'nav');
 List components = (controller.isEmpty.value == false)
        ? [IndexComponent(), CalendarComponent(), FocusComponent()]
        : [TaskComponent(), CalendarComponent(), FocusComponent()];
    return Scaffold(
      body: Obx(
        () => components[controller.index.value],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          Get.bottomSheet(NewTaskComponent(), backgroundColor: Color(0XFF363636));
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(() {
        return NavigationBar(
            selectedIndex: controller.index.value,
            onDestinationSelected: (value) {
              controller.index.value = value;
            },
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.home_filled), label: "Index"),
              NavigationDestination(
                  icon: Icon(Icons.calendar_month_outlined), label: "Calendar"),
              NavigationDestination(icon: Icon(Icons.timer), label: "Focus"),
              NavigationDestination(
                  icon: Icon(Icons.person_3_outlined), label: "Profile"),
            ]);
      }),
    );
  }
}
