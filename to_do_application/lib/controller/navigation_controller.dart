import 'package:get/get.dart';

class NavigationController extends GetxController{
  RxInt index = 0.obs;
  RxInt priorityIndex = 0.obs;
  RxString type = "notCompleted".obs;
  RxInt priority = 0.obs;
  RxString date = "".obs;
  RxBool isEmpty = true.obs;
}