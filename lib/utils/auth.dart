import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import '../utils/auth.dart';


Future<GoogleSignInAccount> getGoogleSignedInAccount(
    GoogleSignIn googleSignIn) async {
  // Is the user already signed in?
  GoogleSignInAccount account = googleSignIn.currentUser;
  // Try to sign in the previous user:
  if (account == null) {
    account = await googleSignIn.signInSilently();
  }
  return account;
}

Future<FirebaseUser> signIntoFirebaseWithGoogle(GoogleSignInAccount googleSignInAccount) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAuthentication googleAuth =
    await googleSignInAccount.authentication;
  return await _auth.signInWithCredential(
    GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    )
  );
}

Future<FirebaseUser> signIntoFirebaseWithFacebook() async {
  final facebookLogin = FacebookLogin();
  final result = await facebookLogin.logInWithReadPermissions(['email']);
  switch (result.status) {
    case FacebookLoginStatus.loggedIn:
      print(result.accessToken.token);
      break;
    case FacebookLoginStatus.cancelledByUser:
      print('CANCELED BY USER');
      break;
    case FacebookLoginStatus.error:
      print(result.errorMessage);
      break;
  }
}