import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/fuilureHandler/firebase_failure.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';

abstract class AuthRepo {
  Future<Either<FireFailure, UserModal>> signUpWithEmailAndPassword({
    required String emailAddress,
    required String password,
    required UserModal usermodal,
  });
  Future<Either<FireFailure, dynamic>> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future<Either<FireFailure, UserModal>> signInWithGoogle({
    required BuildContext context,
  });
  Future<Either<FireFailure, void>> sendRessetPasswordEmail({
    required String emailAddress,
  });
}
