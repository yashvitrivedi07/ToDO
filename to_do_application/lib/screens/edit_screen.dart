import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_application/controller/todo_controller.dart';
import 'package:to_do_application/modal/todo_modal.dart';

class EditScreen extends StatelessWidget {
  EditScreen({super.key});

  TodoModal data = Get.arguments;
  TodoController controller = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 35.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.cancel, size: 28)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.sync_alt,
                    size: 36,
                  )),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.circle_outlined, color: Colors.white),
                    SizedBox(width: 10.w),
                    Text("${data.title}",
                        style: TextStyle(color: Colors.white, fontSize: 18.sp)),
                    SizedBox(height: 5.h),
                    Spacer(),
                    Icon(Icons.edit, color: Colors.white, size: 28),
                    SizedBox(width: 8.w),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h, left: 35.w),
                  child: Text("${data.description}",
                      style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
                ),
                SizedBox(
                  height: 20.h,
                ),

                // TASK TIME
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 28,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Task Time:",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 120.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Color(0XFF363636)),
                      child: Text(
                        "${data.time}",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 30.h,
                ),

                // TASK CATEGORY
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      size: 28,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Task Category:",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(
                      width: 70.w,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 120.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Color(0XFF363636)),
                      child: Text(
                        "Today At 16:45",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.flag,
                      size: 28,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Task Priority:",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(
                      width: 80.w,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 120.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Color(0XFF363636)),
                      child: Text(
                        "${data.priority}",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.account_tree,
                      size: 28,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Sub - Task",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 120.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Color(0XFF363636)),
                      child: Text(
                        "AddSub-Task",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.delete,
                      size: 28,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.deleteTodo(data.id!);
                      },
                      child: Text(
                        "Delete Task",
                        style: TextStyle(fontSize: 16.sp, color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      width: 120.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 190.h,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 45.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0XFF8687E7),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Text(
                    "Edit Task",
                    style: TextStyle(fontSize: 19.sp),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
