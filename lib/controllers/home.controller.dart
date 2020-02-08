import 'package:app_post/enum/auth-state.enum.dart';
import 'package:app_post/models/post.model.dart';
import 'package:app_post/services/auth.service.dart';
import 'package:app_post/services/post.service.dart';
import 'package:app_post/ui/pages/signin.page.dart';
import 'package:app_post/ui/pages/signup.page.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'home.controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  AuthService _authService = GetIt.I.get<AuthService>();
  PostService _postService = GetIt.I.get<PostService>();
  bool get isAuthenticated => _authService.authState == AuthState.LOGGED_IN;

  ObservableStream<List<Post>> posts;

  ObservableStream<List<Post>> listOfPosts() {
    posts = _postService.getList();
    return posts;
  }

  @action
  goToSignIn() {
    Get.to(SignInPage());
  }

  @action
  goToSignUp() {
    Get.to(SignUpPage());
  }

  @action
  signOut() {
    _authService.signOut();
  }

  @action
  goToProfile() {}

  @action
  delete(String documentID) {
    _postService.delete(documentID);
  }
}
