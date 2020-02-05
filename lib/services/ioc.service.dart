import 'package:app_post/controllers/home.controller.dart';
import 'package:app_post/controllers/post/post.controller.dart';
import 'package:app_post/controllers/post/upload-post.controller.dart';

import './post.service.dart';
import './auth.service.dart';
import '../controllers/auth.controller.dart';
import 'package:get_it/get_it.dart';

class IocService {
  GetIt locator = GetIt.I;

  void setupLocator() {
    locator.registerLazySingleton<AuthService>(() => AuthService());
    locator.registerLazySingleton<PostService>(() => PostService());

    locator.registerLazySingleton<AuthController>(() => AuthController());
    locator.registerLazySingleton<PostController>(() => PostController());
    locator.registerLazySingleton<UploadPostController>(
        () => UploadPostController());
    locator.registerLazySingleton<HomeController>(() => HomeController());
  }
}
