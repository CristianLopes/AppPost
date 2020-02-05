class User {
  String uid;
  String providerId;
  String displayName;
  String photoUrl;
  String email;
  String phoneNumber;

  User(
      {this.uid,
      this.providerId,
      this.displayName,
      this.photoUrl,
      this.email,
      this.phoneNumber});

  User.fromMap(var json) {
    this.uid = json['uid'];
    this.providerId = json['providerId'];
    this.displayName = json['displayName'];
    this.photoUrl = json['photoUrl'];
    this.email = json['email'];
    this.phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['uid'] = this.uid;
    map['providerId'] = this.providerId;
    map['displayName'] = this.displayName;
    map['photoUrl'] = this.photoUrl;
    map['email'] = this.email;
    map['phoneNumber'] = this.phoneNumber;

    return map;
  }
}
