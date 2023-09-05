import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ログアウト
Future<void> signOut() async => await FirebaseAuth.instance.signOut();
// Googleログイン
Future<void> signInWithGoogle() async {
  FirebaseAuth auth = FirebaseAuth.instance;

  if (kIsWeb) {
    // web版
    GoogleAuthProvider authProvider = GoogleAuthProvider();
    try {
      await auth.signInWithRedirect(authProvider);
    } catch (e) {
      rethrow;
    }
  } else {
    // モバイル
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount == null) {
      throw Exception("googleSignInAccount 取得失敗");
    }
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    try {
      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
      } else if (e.code == 'invalid-credential') {}
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
