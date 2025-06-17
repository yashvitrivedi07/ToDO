import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_application/controller/todo_controller.dart';
import 'package:to_do_application/getpage/pages.dart';
import 'package:to_do_application/modal/todo_modal.dart';

// After Adding First Task
class IndexComponent extends StatefulWidget {
  IndexComponent({super.key});

  @override
  State<IndexComponent> createState() => _IndexComponentState();
}

class _IndexComponentState extends State<IndexComponent> {
  TodoController todoController = Get.put(TodoController());

  @override
  void initState() {
    super.initState();
    todoController.fetchTodos();
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.filter_list, size: 24),
              Text("Index", style: TextStyle(fontSize: 18.sp)),
              CircleAvatar(radius: 20, backgroundColor: Colors.grey),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for your task...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 230.w, left: 20.w),
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Color(0XFF363636),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Text("Today", style: TextStyle(color: Colors.white)),
        ),
        SizedBox(
          height: 20.h,
        ),
        Expanded(
          child: GetBuilder<TodoController>(
            builder: (context) {
              return FutureBuilder(
                future: todoController.addedExpenses,
                builder: (context,snapshot) {
                   List<TodoModal> todoList = snapshot.data ?? [];
                  if(snapshot.hasData)
                  {
                    return ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(GetPages.edit,arguments: todoList[index]);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          margin:
                              EdgeInsets.only(bottom: 10.h, left: 15.w, right: 20.w),
                          decoration: BoxDecoration(
                            color: Color(0XFF363636),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.circle_outlined, color: Colors.white),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${todoList[index].title}",
                                        style: TextStyle(color: Colors.white)),
                                    SizedBox(height: 5.h),
                                    Row(
                                      children: [
                                        Text("${todoList[index].description}",
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12.sp)),
                                        Spacer(),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.w, vertical: 2.h),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(4.r),
                                          ),
                                          child: Text("University",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10.sp)),
                                        ),
                                        SizedBox(width: 8.w),
                                        Row(
                                          children: [
                                            Icon(Icons.comment,
                                                color: Colors.white, size: 14),
                                            Text("${todoList[index].priority}",
                                                style: TextStyle(color: Colors.white)),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                  }

                  return Text("Nothing");
                }
              );
            }
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          margin: EdgeInsets.only(left: 20.w),
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Color(0XFF363636),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Text("Completed", style: TextStyle(color: Colors.white)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(10.w),
                margin: EdgeInsets.only(bottom: 10.h, left: 20.w, right: 20.w),
                decoration: BoxDecoration(
                  color: Color(0XFF363636),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.circle_outlined, color: Colors.white),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Buy Grocery",
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 5.h),
                          Text("Today At 16:45",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12.sp)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
