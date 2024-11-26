import 'package:bole_nav_app/core/services/real_api/post_api_endpoints.dart';
import 'package:bole_nav_app/core/services/status_checker.dart';
import 'package:bole_nav_app/core/view_models/page_manager_model.dart';
import 'package:bole_nav_app/ui/utils/theme.dart';
import 'package:get_it/get_it.dart';

import '../view_models/post_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Singletons

  // Singleton Services
  locator.registerLazySingleton<BoleNavTheme>(() => BoleNavTheme());
  locator.registerLazySingleton<StatusChecker>(() => StatusChecker());
  locator.registerLazySingleton<PostApiEndpoints>(() => PostApiEndpoints());

  // Singleton ViewModels
  locator.registerLazySingleton<PageManagerModel>(() => PageManagerModel());
  locator.registerLazySingleton<PostModel>(() => PostModel());

  // Factories
  // locator.registerFactory<FaceDetectorModel>(() => FaceDetectorModel());
}
