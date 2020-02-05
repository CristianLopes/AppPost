import 'package:app_post/enum/auth-state.enum.dart';
import 'package:app_post/models/user/authenticate-user.model.dart';
import 'package:app_post/models/user/user.model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthState authState;

  User _userFromFirebaseUser(FirebaseUser firebaseUser) => firebaseUser == null
      ? null
      : User(
          uid: firebaseUser.uid,
          providerId: firebaseUser.providerId,
          displayName: firebaseUser.displayName,
          photoUrl: firebaseUser.photoUrl,
          phoneNumber: firebaseUser.phoneNumber,
        );

  Stream<User> get user => _auth.onAuthStateChanged.map(_userFromFirebaseUser);

  Future<User> signInAnonymously() async {
    AuthResult result = await _auth.signInAnonymously();
    print(result.user != null);
    return _userFromFirebaseUser(result.user);
  }

  Future<User> getCurrentUser() async {
    var firebaseUser = await _auth.currentUser();
    return _userFromFirebaseUser(firebaseUser);
  }

  Future<User> signInWithEmailAndPassword(AuthenticateUser authUser) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: authUser.email, password: authUser.password);
    return _userFromFirebaseUser(result.user);
  }

  Future<User> register(AuthenticateUser authUser) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
      email: authUser.email,
      password: authUser.password,
    );

    _auth.currentUser().then((user) {
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = authUser.name;
      user.updateProfile(userUpdateInfo);
      user.reload();
    });

    result.user.reload();

    return _userFromFirebaseUser(result.user);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
