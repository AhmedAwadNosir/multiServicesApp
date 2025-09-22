import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:multiservices_app/features/auth/presentation/views/login_view.dart';
import 'package:multiservices_app/generated/l10n.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.red,
      ),
      onPressed: () async {
        final GoogleSignIn googleSignIn = GoogleSignIn();
        await FirebaseAuth.instance.signOut();
        await googleSignIn.signOut();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginView()),
          (Route<dynamic> route) => false, // removes all previous routes
        );
      },
      child: Text(
        S.of(context).SignOut,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
