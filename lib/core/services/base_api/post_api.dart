

import 'package:bole_nav_app/core/models/post.dart';

abstract class PostApi {

  // Get created deliveries
  Future<List<Post>> getPosts();


}
