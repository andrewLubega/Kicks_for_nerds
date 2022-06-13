import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kicks_for_nerds/models/MyAppUser.dart';
import 'package:kicks_for_nerds/services/database.dart';

class AuthService {
  final FirebaseAuth _auth;
  AuthService(this._auth);

  Stream<User> get authStateChanges => _auth.authStateChanges();
  //create MyAppUser from a Firebase User
  // ignore: missing_return
  MyAppUser _userFromFirebaseUser(User user) {
    return user != null ? MyAppUser(uid: user.uid, email: user.email) : null;
  }

  //create Firebase User
  Future registerFirebaseUser(
      String email, String password, String fullName, String handle) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      await DataBase(uid: user.uid)
          .updateFlutterArticlesUser(user, fullName, handle);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //login Firebase User
  Future loginFirebaseUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signOutFirebaseUser() async {
    await _auth.signOut();

    // try {
    //   await _auth.signOut();
    // } catch (e) {
    //   print(e.toString());
    //   return null;
    // }
  }

  //TODO here
  Future<String> currentUser() async {
    final User user = await FirebaseAuth.instance.currentUser;
    return user.uid.toString();
  }

  Stream<MyAppUser> get user =>
      _auth.authStateChanges().map(_userFromFirebaseUser);
}
