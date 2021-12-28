import 'package:get/get.dart';
import 'package:task/apis/api_provider.dart';
import 'package:task/screens/my_home_page_controller.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.put(ApiProvider());
    Get.put(MyHomePageController());
  }

}