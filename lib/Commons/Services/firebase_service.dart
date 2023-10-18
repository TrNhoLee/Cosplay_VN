import 'package:cosplay_vn/Commons/Services/api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  Future signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
        ApiServices.firebaseAccessToken =
            googleSignInAuthentication.accessToken ?? "";
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    } catch (e) {
      print(e);
    }
  }

  signOut() {
    _auth.signOut();
    _googleSignIn.disconnect();
  }

  Future<bool> isLogged() async {
    var currentUser = _auth.currentUser;

    if (currentUser != null) {
      await currentUser.reload();

      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        await googleSignInAccount.authentication;
        ApiServices.firebaseAccessToken =
            (await googleSignInAccount.authentication).accessToken ?? "";
      }
    }

    return currentUser != null;
  }
}
