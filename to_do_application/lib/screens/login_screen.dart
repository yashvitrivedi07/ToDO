import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_application/getpage/pages.dart';
import 'package:to_do_application/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController loginEmail = TextEditingController();
    TextEditingController loginPassword = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 32.sp),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: loginEmail,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    labelText: "Username",
                    hintText: "Enter your Username",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: TextFormField(
                controller: loginPassword,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    labelText: "Password",
                    hintText: "* * * * * * * * * *",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
            ),
            GestureDetector(
              onTap: () async {
                  String email = loginEmail.text;
                  String password = loginPassword.text;

                  if (email.isNotEmpty && password.isNotEmpty) {
                    String msg = await AuthService.as
                        .login(email: email, password: password);
                    if (msg == "success") {
                      Get.toNamed(GetPages.home);
                      Get.snackbar("title", "message",
                          backgroundColor: Colors.green);
                    } else {
                      Get.snackbar('erro', msg);
                    }
                  } else {
                    Get.snackbar('Required', "pls fill all field",
                        backgroundColor: Colors.redAccent);
                  }
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(
                    top: 55.h, left: 20.w, right: 20.w, bottom: 10.h),
                decoration: BoxDecoration(
                    color: Color(0xFF8687E7),
                    borderRadius: BorderRadius.circular(3.r)),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Divider(
                    color: Colors.white,
                  )),
                  Text(
                    " or ",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.white,
                  )),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF8687E7)),
                  borderRadius: BorderRadius.circular(3.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/img/search.png",
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    "  Login with Google",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 142, 143, 217)),
                  borderRadius: BorderRadius.circular(3.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/img/apple-logo.png",
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                  Text(
                    "  Login with Apple",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white38),
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed(GetPages.signup);
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white60),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
