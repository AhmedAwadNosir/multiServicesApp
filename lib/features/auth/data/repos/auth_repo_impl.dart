import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiservices_app/core/services/firebase_servieces.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/core/utils/fuilureHandler/firebase_failure.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/auth/data/repos/auth_repo.dart';
import 'package:multiservices_app/generated/l10n.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseServieces firebaseServieces;

  AuthRepoImpl({required this.firebaseServieces});
  @override
  Future<Either<FireFailure, UserModal>> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await firebaseServieces
          .signInUserWithEmailPassword(
            emailAddress: emailAddress,
            password: password,
          );
      DocumentSnapshot snapshot = await firebaseServieces.getDoc(
        colecName: AppConstants.userColection,
        docId: userCredential.user!.uid,
      );
      return right(UserModal.fromJson(snapshot.data()));
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthError(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  // update sign in with google to handle error of time of phone not correct
  @override
  Future<Either<FireFailure, UserModal>> signInWithGoogle({
    required BuildContext context,
  }) async {
    try {
      var credintial = await firebaseServieces.signInWithGoogle();

      if (credintial.user != null) {
        UserModal userModal = UserModal(
          userName: credintial.user!.displayName!,
          profilImageLink: credintial.user!.photoURL!,
        );
        await firebaseServieces.addDocwithId(
          colecName: AppConstants.userColection,
          data: userModal.toJson(),
          docId: credintial.user!.uid,
        );
      }
      DocumentSnapshot snapshot = await firebaseServieces.getDoc(
        colecName: AppConstants.userColection,
        docId: credintial.user!.uid,
      );

      return right(UserModal.fromJson(snapshot.data()));
    } catch (e) {
      /// 🔴 1. Firebase Auth Errors
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthError(e));
      }

      /// 🔴 2. Platform Exceptions (Google Sign-In, etc.)
      if (e is PlatformException) {
        final code = e.code.toLowerCase();
        final message = e.message?.toLowerCase() ?? "";

        /// 👉 Case: Google token null issue
        if (message.contains("access token") || message.contains("id token")) {
          return left(
            FirebaseFailure(
              "LoginCanceled", // or custom message
            ),
          );
        }

        /// 👉 Case: Generic Google sign-in error
        if (code == "exception" || message.contains("error")) {
          return left(
            FirebaseFailure(
              S
                  .of(context)
                  .PleasecheckyourtimesettingsandmakesuretheAMPMiscorrect,
            ),
          );
        }

        /// 👉 Unknown platform error
        return left(FirebaseFailure("UnexpectedError pleas try again later"));
      }

      /// 🔴 3. Fallback (any other error)
      return left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<FireFailure, UserModal>> signUpWithEmailAndPassword({
    required String emailAddress,
    required String password,
    required UserModal usermodal,
  }) async {
    try {
      UserCredential userCredential = await firebaseServieces
          .signUpUserWithEmailPassword(
            emailAddress: emailAddress,
            password: password,
          );
      if (userCredential.user != null) {
        firebaseServieces.addDocwithId(
          colecName: AppConstants.userColection,
          data: usermodal.toJson(),
          docId: userCredential.user!.uid,
        );
      }
      DocumentSnapshot snapshot = await firebaseServieces.getDoc(
        colecName: AppConstants.userColection,
        docId: userCredential.user!.uid,
      );
      return right(UserModal.fromJson(snapshot.data()));
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthError(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<FireFailure, void>> sendRessetPasswordEmail({
    required String emailAddress,
  }) async {
    try {
      var result = await firebaseServieces.sendRessetPasswordEmail(
        emialAddress: emailAddress,
      );
      return right(result);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthError(e));
      } else {
        log(e.toString());
        return left(FirebaseFailure(e.toString()));
      }
    }
  }
}
