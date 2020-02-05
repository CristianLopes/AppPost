import 'package:app_post/controllers/post/upload-post.controller.dart';
import 'package:app_post/models/post/upload-post.mode.dart';
import 'package:app_post/models/user/user.model.dart';
import 'package:app_post/utils/string-utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadPostPage extends StatelessWidget {
  final UploadPostController postController =
      GetIt.I.get<UploadPostController>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  UploadPostPage({UploadPost post}) {
    print(postController.uploadPost);
    if (post != null) {
      postController.uploadPost = post ?? UploadPost();
      titleController.text = post.title;
      bodyController.text = post.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar publicação"),
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Observer(builder: (_) {
                return FlatButton(
                  child: Text('PUBLICAR'),
                  onPressed: postController.uploadPost.isValid
                      ? () {
                          postController.publish(user);
                        }
                      : null,
                );
              }),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Observer(
                builder: (_) {
                  return TextField(
                    controller: titleController,
                    onChanged: postController.uploadPost.changeTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: "Comer para viver ou viver para comer?",
                      errorText: postController.uploadPost.validateTitle(),
                    ),
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return TextField(
                    controller: bodyController,
                    onChanged: postController.uploadPost.changeBody,
                    minLines: 15,
                    maxLines: 20,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText:
                          "Escolha um tema e vamos conversar sobre este assunto pode ser?",
                      border: OutlineInputBorder(),
                      errorText: postController.uploadPost.validateBody(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Observer(
                    builder: (_) {
                      return postController.uploadPost.image == null
                          ? Image.asset(
                              "assets/images/nophoto.jpeg",
                              width: 80,
                            )
                          : Image.memory(
                              StringUtility.dataFromBase64String(
                                  postController.uploadPost.image),
                              width: 80,
                            );
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => postController
                            .pickImageFromGallery(ImageSource.gallery),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/photos.png",
                              width: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Fotos da galeria"),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () => postController
                            .pickImageFromGallery(ImageSource.camera),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/camera.png",
                              width: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Câmera"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
