import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:multiservices_app/core/functions/tregir_cubit_check_connectavity.dart';
import 'package:multiservices_app/core/services/firebase_servieces.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/auth/presentation/views/login_view.dart';
import 'package:multiservices_app/features/home/notes/functions/show_confirmation_dialog.dart';
import 'package:multiservices_app/generated/l10n.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DelletAccountButton extends StatelessWidget {
  const DelletAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.red,
      ),
      onPressed: () async {
        showConfermaTionDailog(
          context,
          dailogTitle: S.of(context).AreYousureyouwanttodelleteyouraccout,
          cancelButtonName: S.of(context).Cancel,
          confirmButtonName: S.of(context).Dellete,
          confirmOnPressed: () async {
            var hasInternetAcess = await InternetConnection().hasInternetAccess;
            if (!hasInternetAcess) {
              showErrorConectionDialog(context: context);
            } else {
              try {
                FirebaseServieces firebaseServieces = FirebaseServieces();
                FirebaseAuth auth = FirebaseAuth.instance;
                final GoogleSignIn googleSignIn = GoogleSignIn();

                //2- dellet all data reated to this account
                await firebaseServieces.deleteDoc(
                  colecName: AppConstants.userColection,
                  docId: auth.currentUser!.uid,
                );
                await FirebaseAuth.instance.currentUser!.delete();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                  (Route<dynamic> route) =>
                      false, // removes all previous routes
                );
                await googleSignIn.signOut();
              } catch (e) {
                showErrorDialog(context: context, errorMessage: e.toString());
              }
            }
          },
          cancelOnPressed: () {
            Navigator.pop(context);
          },
        );
      },
      child: Text(
        S.of(context).DelleteAccount,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
