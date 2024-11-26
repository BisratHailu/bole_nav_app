import 'package:bole_nav_app/core/models/post.dart';
import 'package:flutter/material.dart';

import '../../views/post_detail_view.dart';

class BoleNavRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PostDetailView.kPostDetailView:
        return MaterialPageRoute(
          builder: (_) => PostDetailView(
            post: settings.arguments as Post,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
