import 'package:get/get.dart';

import 'add_data_controller.dart';

class AddDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDataController>(
      () => AddDataController(),
    );
  }
}
