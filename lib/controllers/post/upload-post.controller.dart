import 'package:app_post/models/post/upload-post.mode.dart';
import 'package:app_post/models/user/user.model.dart';
import 'package:app_post/services/message.service.dart';
import 'package:app_post/services/post.service.dart';
import 'package:app_post/utils/string-utility.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'upload-post.controller.g.dart';

class UploadPostController = _UploadPostControllerBase
    with _$UploadPostController;

abstract class _UploadPostControllerBase with Store {
  PostService _postService = GetIt.I.get<PostService>();

  @observable
  UploadPost uploadPost;

  @action
  publish(User user) {
    try {
      uploadPost.user = user;
      if (uploadPost.documentId == null) {
        add();
      } else {
        edit();
      }
    } catch (e) {
      MessageService.showSnackBar(e.toString());
    }
  }

  add() {
    _postService.create(uploadPost);
    Get.back();
  }

  edit() {
    _postService.update(uploadPost);
    Get.back();
  }

  pickImageFromGallery(ImageSource source) async {
    var imageFile = await ImagePicker.pickImage(source: source);
    var data = await imageFile.readAsBytes();
    uploadPost.changeImage(StringUtility.base64String(data));
  }
}
