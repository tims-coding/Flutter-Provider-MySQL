import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class AuthService {
  final _auth = FirebaseAuth.instance;

  // Firebase user one-time fetch
  Future<User?> get getUser async => _auth.currentUser;

  Stream<User?> get user => _auth.authStateChanges();

  // Sign In with Email & Password
  Future<User?> signInEmailPassword(String email, String password) async {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;

    //updateUserData(user);
    return user;
  }

  // Create User with Email & Password
  Future<User?> createUserEmailPassword(String email, String password) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;
    //updateUserData(user);
    return user;
  }

  // Sign out
  Future<void> signOut() {
    return _auth.signOut();
  }
}
