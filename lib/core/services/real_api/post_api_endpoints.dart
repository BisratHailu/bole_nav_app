import 'package:bole_nav_app/core/models/post.dart';
import 'package:bole_nav_app/core/services/base_api/post_api.dart';
import 'package:dio/dio.dart';

import '../../../ui/utils/consts.dart';
import '../../enums/response_status.dart';
import '../locator.dart';

class PostApiEndpoints extends PostApi {

  final Dio _dio = Dio();
// Get created deliveries
  @override
  Future<List<Post>> getPosts() async {
    List<Post> posts = [];
    try {
      final Response response = await _dio.get(
        'https://blog.bolenav.com/wp-json/wp/v2/posts',
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return true;
          },
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      print(response.data);
      if (response.statusCode == 200) {
        var data = response.data;
        var decodedData = data as List;
        posts = decodedData.map(
              (e) {
            return Post.fromJson(e);
          },
        ).toList();
        return posts;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

}
