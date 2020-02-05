import 'package:app_post/models/post.model.dart';
import 'package:app_post/models/post/upload-post.mode.dart';
import 'package:app_post/repositories/post.repository.dart';
import 'package:mobx/mobx.dart';

class PostService {
  PostRepository repository = PostRepository();

  ObservableStream<List<Post>> getList() {
    return repository.posts;
  }

  ObservableStream<List<Post>> getListByUser() {
    return repository.posts;
  }

  void create(UploadPost uploadPost) {
    repository.add(
      Post(
        title: uploadPost.title,
        body: uploadPost.body,
        image: uploadPost.image,
        createddate: DateTime.now(),
        updateddate: DateTime.now(),
        user: uploadPost.user,
      ),
    );
  }

  void update(UploadPost uploadPost) {
    repository.update(
      Post(
        documentId: uploadPost.documentId,
        title: uploadPost.title,
        body: uploadPost.body,
        image: uploadPost.image,
        createddate: DateTime.now(),
        updateddate: DateTime.now(),
        user: uploadPost.user,
      ),
    );
  }

  void delete(String documentId) {
    repository.delete(documentId);
  }
}
