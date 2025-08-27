import 'package:get/get.dart';
import 'package:rpl1getx/app/data/models/quran.dart';
import 'package:rpl1getx/app/services/quran_services.dart'; // ubah juga nama file servicenya biar konsisten

class QuranController extends GetxController {
  final QuranService _quranService = Get.put(QuranService());

  RxList<Quran> quranList = <Quran>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSurah();
  }

  void fetchSurah() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await _quranService.fetchSurah();

      if (response.statusCode == 200 && response.body != null) {
        var data = (response.body as List)
            .map((surahJson) => Quran.fromJson(surahJson))
            .toList();
        quranList.assignAll(data);
      } else {
        errorMessage('Error: ${response.statusText}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
}
