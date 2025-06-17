import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



// IF THERE's NO TASK 
class TaskComponent extends StatelessWidget {
  const TaskComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.filter_2_outlined, size: 24)),
            ),
            Text(
              "Index",
              style: TextStyle(fontSize: 16.sp),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    size: 32,
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 55.h,
        ),
        Image.asset(
          "assets/img/Checklist-rafiki 1.png",
        ),
        Text(
          "What do you want to do today?",
          style: TextStyle(fontSize: 16.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Tap + to add your tasks",
          style: TextStyle(fontSize: 12.sp),
        )
      ],
    );
  }
}