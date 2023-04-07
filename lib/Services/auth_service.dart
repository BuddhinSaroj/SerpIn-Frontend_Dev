import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}

// import 'dart:ffi';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class FirebaseServices {
//   final _auth = FirebaseAuth.instance;
//   final _googleSignIn = GoogleSignIn();
//
//   signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//           await _googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleSignInAuthentication =
//             await googleSignInAccount.authentication;
//         final AuthCredential authCredential = GoogleAuthProvider.credential(
//             accessToken: googleSignInAuthentication.accessToken,
//             idToken: googleSignInAuthentication.idToken);
//         await _auth.signInWithCredential(authCredential);
//       }
//     } on FirebaseAuthException catch (e) {
//       print(e.message);
//       throw e;
//     }
//   }
//
//   googleSignOut() async {
//     await _auth.signOut();
//     await _googleSignIn.signOut();
//   }
// }
