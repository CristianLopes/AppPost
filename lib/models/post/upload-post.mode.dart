import 'package:app_post/models/user/user.model.dart';
import 'package:mobx/mobx.dart';
part 'upload-post.mode.g.dart';

class UploadPost = _UploadPostBase with _$UploadPost;

abstract class _UploadPostBase with Store {
  User user;
  String documentId;

  @observable
  String title;

  @observable
  String body;

  @observable
  String image = '';

  _UploadPostBase(
      {this.documentId, this.title, this.body, this.image, this.user});

  @computed
  bool get isValid => validateTitle() == null && validateBody() == null;

  @action
  changeTitle(String newValue) => title = newValue ?? '';

  @action
  changeBody(String newValue) => body = newValue ?? '';

  @action
  changeImage(String newValue) => image = newValue ?? '';

  String validateTitle() {
    bool isValid = title != null && title.isNotEmpty;
    if (!isValid) {
      return 'O título da publicação é obrigatório';
    }

    return null;
  }

  String validateBody() {
    bool isValid = body != null && body.isNotEmpty;
    if (!isValid) {
      return 'O corpo da publicação é obrigatório';
    }

    return null;
  }
}
