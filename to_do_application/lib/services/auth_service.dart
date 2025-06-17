import 'package:firebase_auth/firebase_auth.dart';

mixin Auth {
  Future<String> register({required String email, required String password});
  Future<String> login({required String email, required String password});
}

class AuthService with Auth {
  AuthService._();

  static AuthService as = AuthService._();

  FirebaseAuth auth = FirebaseAuth.instance;

  User? get currentUser => auth.currentUser;

  @override
  Future<String> login(
      {required String email, required String password}) async {
    String msg = "";
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      msg = "success";
    } on FirebaseAuthException catch (e) {
      msg = e.code;
    }
    return msg;
  }

  @override
  Future<String> register(
      {required String email, required String password}) async {
    String msg = "";
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      msg = "success";
    } on FirebaseAuthException catch (e) {
      msg = e.code;
    }

    return msg;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  void signInWithGoogle() {}
}
