import '../enums/view_state.dart';
import '../models/post.dart';
import '../services/locator.dart';
import '../services/real_api/post_api_endpoints.dart';
import '../services/status_checker.dart';
import 'base_model.dart';

class PostModel extends BaseModel {
  // Dependencies
  PostApiEndpoints postApiEndpoints = locator<PostApiEndpoints>();
  StatusChecker statusChecker = locator<StatusChecker>();

  bool canDispose = false;

  // Requested pending deliveries
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  // Get created deliveries
  Future<void> intPosts() async {
    initState<PostsViewState>(PostsViewState.busy);
    if (await statusChecker.checkConnection()) {
      _posts = await postApiEndpoints.getPosts();
    }
    setState<PostsViewState>(PostsViewState.idle);
  }

  Future<void> loadPosts() async {
    setState<PostsViewState>(PostsViewState.busy);
    if (await statusChecker.checkConnection()) {
      _posts = await postApiEndpoints.getPosts();
    }
    setState<PostsViewState>(PostsViewState.idle);
  }

  @override
  void dispose() {
    if (canDispose) {
      // Call super only if canDispose is true
      super.dispose();
    }
  }
}
