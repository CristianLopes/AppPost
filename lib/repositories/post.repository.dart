import 'package:mobx/mobx.dart';

import '../models/post.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostRepository {
  CollectionReference _collection = Firestore.instance.collection("posts");

  //create new post
  void add(Post post) => _collection.add(post.toMap());

  //update post
  void update(Post post) =>
      _collection..document(post.documentId).updateData(post.toMap());

  //delete post
  void delete(String documentId) => _collection..document(documentId).delete();

  //read list post
  ObservableStream<List<Post>> get posts {
    var data = _collection
        .orderBy("updateddate", descending: true)
        .snapshots()
        .map(
          (query) => query.documents
              .map<Post>((document) => Post.fromMap(document))
              .toList(),
        )
        .asObservable();

    return data;
  }

  //read list of user's post

}
