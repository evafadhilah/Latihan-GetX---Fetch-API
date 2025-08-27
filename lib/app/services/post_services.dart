import 'package:get/get_connect.dart';

class PostsServices extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com';
    super.onInit();
  }

  Future<Response<List<dynamic>>> fetchPosts() {
    return get('/posts'); // sementara masih pakai endpoint posts (dummy data)
  }
}
