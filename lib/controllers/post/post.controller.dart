import 'package:app_post/models/post.model.dart';
import 'package:app_post/models/post/upload-post.model.dart';
import 'package:app_post/services/message.service.dart';
import 'package:app_post/services/post.service.dart';
import 'package:app_post/ui/pages/upload-post.page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'post.controller.g.dart';

class PostController = _PostControllerBase with _$PostController;

abstract class _PostControllerBase with Store {
  PostService _postService = GetIt.I.get<PostService>();

  @action
  delete(String documentId) {
    try {
      _postService.delete(documentId);
      Get.snackbar("Atenção", "Registro deletado com sucesso",
          colorText: Colors.black);
    } catch (e) {
      MessageService.showSnackBar(e.toString());
    }
  }

  @action
  edit(Post post) {
    try {
      UploadPost uploadPost = UploadPost(
        documentId: post.documentId,
        title: post.title,
        body: post.body,
        image: post.image,
        user: post.user,
      );
      Get.to(UploadPostPage(
        post: uploadPost,
      ));
    } catch (e) {
      MessageService.showSnackBar(e.toString());
    }
  }

  goBack() {
    Get.back();
  }
}
