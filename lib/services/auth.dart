import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_based_app/models/current_user.dart';
import 'package:firebase_based_app/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on User
  CurrentUser? _userFromFirebase(User? user) {
    return user != null ? CurrentUser(uid: user.uid) : null;
  }

  // Using stream
  Stream<CurrentUser?> get user {
    return _auth
        .authStateChanges()
        //.map((User? user) => _userFromFirebase(user!));
        .map(_userFromFirebase);
  }

  //sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userFromFirebase(user);
    } catch (e) {
      print("Error ");
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;

      // create a new document for the new user

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and passward
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
