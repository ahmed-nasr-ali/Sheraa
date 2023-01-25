// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/more/regester%20and%20log%20in/log%20in/forget%20password/reset%20password/reset_password.dart';
import 'package:sheraa/ui/more/regester%20and%20log%20in/regester/regester%20screen/register_screen.dart';

class FirebaseAutProvider extends ChangeNotifier {
  // final googleSignIn = GoogleSignIn();

  // GoogleSignInAccount?
  //     _user; //do ( للمستخدمين الي سجلو الدخول هيبفا فيها كل البينات بتاعت المستخدمين)

  // GoogleSignInAccount get user1 => _user!;

  // Future googleLogin(BuildContext context) async {
  //   try {
  //     final googleUser =
  //         await googleSignIn.signIn().onError((error, stackTrace) {
  //       final snackBar = SnackBar(
  //           content: Text('you did not sign with google'),
  //           backgroundColor: Colors.blue);
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     });

  //     if (googleUser == null) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => RegesiterationPage(),
  //         ),
  //       );
  //     }
  //     _user = googleUser;
  //     print('111111111111111111111111111111111111111111111111111111111111');
  //     print(user1.displayName);
  //     print('222222222222222222222222222222222222222222222222222222222222');

  //     final googleAuth = await googleUser!.authentication;
  //     print('333333333333333333333333333333333333333333333333333333333333');
  //     print(googleAuth.idToken);

  //     final credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   notifyListeners();
  // }

//------------------------------------------------------------------------------------------------------
  ///SignUpWitheEmailAndPassward

  // Future SignUpWitheEmailAndPassward(
  //     String myEmail, String myPassward, BuildContext context) async {
  //   try {
  //     final credential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: myEmail,
  //       password: myPassward,
  //     );

  //     return credential;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       final snackBar = SnackBar(
  //           content: Text('the Passward is too weak'),
  //           backgroundColor: Colors.blue);
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     } else if (e.code == 'email-already-in-use') {
  //       final snackBar = SnackBar(
  //           content: Text('The account already exists for that email.'),
  //           backgroundColor: Colors.blue);
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   notifyListeners();
  // }

//-------------------------------------------------------------------------------------------------------------
  /// logInWithEmailAndPassward
  // Future logInWithEmailAndPassward(
  //     String myEmail, String myPassward, BuildContext context) async {
  //   try {
  //     final credential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: myEmail, password: myPassward);
  //     return credential;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       final snackBar = SnackBar(
  //           content: Text('No user found for that email.'),
  //           backgroundColor: Colors.blue);
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);

  //       // print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       final snackBar = SnackBar(
  //           content: Text('Wrong password provided for that user.'),
  //           backgroundColor: Colors.blue);
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);

  //       print('Wrong password provided for that user.');
  //     }
  //   }
  //   notifyListeners();
  // }
//------------------------------------------------------------------------------------------------------------
//phone auth

  var verificationId_input;
  int token = 0;
  Future verifyPhoneNumber(String phone) async {
    print("come here");
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) async {},
      codeSent: (String verificationId, int? resendToken) async {
        verificationId_input = verificationId;
        token = resendToken!;
        // print(
        //     '=============================================================================================');
        // print('verfication input is ' + verificationId_input);
        // print('the user token is' "$token");
        // print(
        //     '=============================================================================================');
      },
      timeout: const Duration(seconds: 2),
      codeAutoRetrievalTimeout: (String verificationId) async {
        print('time out');
      },
    );
    notifyListeners();
  }

  Future sendCodeToFirebase(
      {String? code, required BuildContext context}) async {
    if (verificationId_input != null) {
      print('okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
      var credential = PhoneAuthProvider.credential(
          verificationId: verificationId_input, smsCode: code!);


      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
            value.user!.getIdToken().then((Token) {
              UserData.setFirebaseUserToken('');
              UserData.setFirebaseUserToken(Token);

              print('Token is ' + UserData.getFirebaseUserToken()!);
              print("==========================================");
            });

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));
            // print(
            //     "=----------------------------------------------------------------------");
            // print(value);

            // print(
            //     '5555555555555555555555555555555555555555555555555555555555555555555555555555555555');
            value.user!.getIdToken().then((Token) {
              UserData.setFirebaseUserToken(Token);
              print('Token is ' + UserData.getFirebaseUserToken()!);
            });
          })
          .whenComplete(() {})
          .onError((error, stackTrace) {
            print('error is ' + '$error');
          });
    }
    notifyListeners();
  }

  Future sendCodeForForgetPasswardToFirebase(
      {String? code, required BuildContext context}) async {
    if (verificationId_input != null) {
      // print('okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
      var credential = PhoneAuthProvider.credential(
          verificationId: verificationId_input, smsCode: code!);

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
            value.user!.getIdToken().then((Token) {
              UserData.setFirebaseUserToken('');
              UserData.setFirebaseUserToken(Token);
              print('Token is ' + UserData.getFirebaseUserToken()!);
            });
            Navigator.pop(context);
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: ResetPassword(),
                  );
                });
            // print(
            //     "=----------------------------------------------------------------------");
            // print(value);

            // print(
            //     '5555555555555555555555555555555555555555555555555555555555555555555555555555555555');
          })
          .whenComplete(() {})
          .onError((error, stackTrace) {
            print('error is ' + '$error');
          });
    }
    notifyListeners();
  }

  // Future logout() async {
  //   googleSignIn.disconnect();
  //   FirebaseAuth.instance.signOut();
  // }

  String? _userPhoneNumber;

  void setUserPhoneNumber(String userPhoneNumber) {
    _userPhoneNumber = userPhoneNumber;

    notifyListeners();
  }

  String get userPhoneNumber => _userPhoneNumber!;
}
