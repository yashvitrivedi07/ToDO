import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_application/controller/navigation_controller.dart';

class PriorityDialogComponent extends StatelessWidget {
  const PriorityDialogComponent({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController controller = Get.find<NavigationController>(tag: 'nav');

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(10),
      child: UnconstrainedBox(
        child: Material(
          color: Color(0XFF363636),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 0.9.sw,
            height: 330.h,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Task Priority",
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
                Divider(color: Colors.white24),
                SizedBox(height: 10.h),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                    children: List.generate(10, (index) {
                      return Obx(() {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: index == controller.priorityIndex.value
                                ? Color(0xFF8687E7)
                                : Colors.grey.shade800,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.r),
                            ),
                          ),
                          onPressed: () {
                            controller.priorityIndex.value = index;
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.flag, color: Colors.white, size: 25),
                              SizedBox(height: 4),
                              Text(
                                '${index + 1}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      });
                    }),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        fixedSize: Size(140.w, 50.h),
                      ),
                      onPressed: () {
                        Get.back(); 
                      },
                      child: Text("Cancel"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        fixedSize: Size(140.w, 50.h),
                      ),
                      onPressed: () {
                        Get.back(); 
                      },
                      child: Text("Save"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
