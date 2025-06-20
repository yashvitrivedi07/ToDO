import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_application/getpage/pages.dart';
import 'package:to_do_application/services/auth_service.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(onPressed: () {
        Get.offNamed(GetPages.login);
        AuthService.as.signOut();
      }, child: Text("Logout",style: TextStyle(fontSize: 20.sp),)),
    );
  }
}