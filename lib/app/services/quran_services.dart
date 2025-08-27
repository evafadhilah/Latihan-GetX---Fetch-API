import 'package:get/get_connect/connect.dart';

class QuranService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://api.npoint.io/99c279bb173a6e28359c';
    super.onInit();
  }

  Future<Response<List<dynamic>>> fetchSurah() async {
    return get('/data'); // sesuai endpoint
  }
}