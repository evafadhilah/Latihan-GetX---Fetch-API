import 'package:get/get.dart';
import 'package:rpl1getx/app/modules/FormPendaftaran/controllers/form_pendaftaran_controller.dart';
import 'package:rpl1getx/app/modules/post/controllers/post_controller.dart';
import 'package:rpl1getx/app/modules/quran/controllers/quran_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<PostController>(
      () =>PostController(),
    );
    Get.lazyPut<FormPendaftaranController>(
      () => FormPendaftaranController(),
    );
    Get.lazyPut<QuranController>(
      () => QuranController(),
    );
  }
}
