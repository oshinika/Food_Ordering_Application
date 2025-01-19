import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Get instance of FirebaseAuth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Sign in
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    try {
      // Sign user in
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Catch and throw exceptions with meaningful messages
      throw Exception(e.message ?? "Sign-in failed");
    }
  }

  // Sign up
  Future<UserCredential> signUpWithEmailPassword(String email, String password) async {
    try {
      // Sign user up
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Catch and throw exceptions with meaningful messages
      throw Exception(e.message ?? "Sign-up failed");
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception("Sign-out failed");
    }
  }
}
