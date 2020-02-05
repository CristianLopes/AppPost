import 'package:app_post/models/user/user.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  User user;
  String documentId;
  String title;
  String body;
  String image;
  DateTime createddate;
  DateTime updateddate;
  String diferenceToDateTimeNow;

  Post(
      {this.documentId,
      this.title,
      this.body,
      this.image,
      this.createddate,
      this.updateddate,
      this.user});

  Post.fromMap(DocumentSnapshot documentSnapshot) {
    this.documentId = documentSnapshot.documentID;

    this.title = documentSnapshot.data['title'];
    this.body = documentSnapshot.data['body'];
    this.image = documentSnapshot.data['image'];
    this.user = User.fromMap(documentSnapshot.data['user']);
    this.createddate = documentSnapshot.data['createddate'].toDate();
    this.updateddate = documentSnapshot.data['updateddate'].toDate();

    setDiferenceToDateTimeNow();
  }

  toMap() {
    var map = new Map<String, dynamic>();
    map['title'] = this.title;
    map['body'] = this.body;
    map['image'] = this.image;
    map['createddate'] = this.createddate;
    map['updateddate'] = this.updateddate;
    map['user'] = this.user.toMap();

    return map;
  }

  setDiferenceToDateTimeNow() {
    if (DateTime.now().difference(this.updateddate).inDays >= 1) {
      diferenceToDateTimeNow = this.updateddate.toString();
    } else if (DateTime.now().difference(this.updateddate).inHours >= 1) {
      diferenceToDateTimeNow =
          "${DateTime.now().difference(this.updateddate).inHours} h";
    } else {
      diferenceToDateTimeNow =
          "${DateTime.now().difference(this.updateddate).inMinutes} min";
    }
  }
}
