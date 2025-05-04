import 'package:firebase_auth/firebase_auth.dart';

abstract class FireFailure {
  final String errorMessage;

  FireFailure(this.errorMessage);
}

class FirebaseFailure extends FireFailure {
  FirebaseFailure(super.errorMessage);

  factory FirebaseFailure.fromFirebaseAuthError(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return FirebaseFailure('The email address is badly formatted.');
      case 'user-disabled':
        return FirebaseFailure('This user account has been disabled.');
      case 'user-not-found':
        return FirebaseFailure('No user found with this email address.');
      case 'wrong-password':
        return FirebaseFailure('Incorrect password. Please try again.');
      case 'email-already-in-use':
        return FirebaseFailure(
          'This email is already registered. Please use another email.',
        );
      case 'operation-not-allowed':
        return FirebaseFailure(
          'This operation is not allowed. Contact support.',
        );
      case 'weak-password':
        return FirebaseFailure(
          'The password is too weak. Please choose a stronger password.',
        );
      case 'requires-recent-login':
        return FirebaseFailure(
          'This operation requires recent authentication. Please log in again.',
        );
      case 'too-many-requests':
        return FirebaseFailure('Too many requests. Please try again later.');
      case 'account-exists-with-different-credential':
        return FirebaseFailure(
          'An account already exists with the same email but different sign-in credentials.',
        );
      case 'invalid-credential':
        return FirebaseFailure('The credential is malformed or has expired.');
      case 'invalid-verification-code':
        return FirebaseFailure('The verification code is invalid.');
      case 'invalid-verification-id':
        return FirebaseFailure('The verification ID is invalid.');
      case 'network-request-failed':
        return FirebaseFailure(
          'Network error occurred. Please check your internet connection.',
        );
      case 'provider-already-linked':
        return FirebaseFailure(
          'This provider is already linked to your account.',
        );
      case 'credential-already-in-use':
        return FirebaseFailure(
          'This credential is already associated with a different user.',
        );
      case 'expired-action-code':
        return FirebaseFailure('The action code has expired.');
      case 'invalid-action-code':
        return FirebaseFailure('The action code is invalid.');
      default:
        return FirebaseFailure(
          'An unexpected error occurred. Please try again.',
        );
    }
  }

  factory FirebaseFailure.fromFirebaseStorageError(FirebaseException error) {
    switch (error.code) {
      case 'object-not-found':
        return FirebaseFailure(
          'The file you are trying to access does not exist.',
        );
      case 'bucket-not-found':
        return FirebaseFailure('The storage bucket is not configured.');
      case 'project-not-found':
        return FirebaseFailure('The project is not configured.');
      case 'quota-exceeded':
        return FirebaseFailure('The storage quota has been exceeded.');
      case 'unauthenticated':
        return FirebaseFailure('User is not authenticated. Please sign in.');
      case 'unauthorized':
        return FirebaseFailure(
          'User is not authorized to perform this action.',
        );
      case 'retry-limit-exceeded':
        return FirebaseFailure('The operation retry limit has been exceeded.');
      case 'invalid-checksum':
        return FirebaseFailure('File corruption detected during transfer.');
      case 'canceled':
        return FirebaseFailure('The operation was canceled.');
      case 'download-size-exceeded':
        return FirebaseFailure('The download size exceeds the allowed limit.');
      default:
        return FirebaseFailure('A storage error occurred. Please try again.');
    }
  }

  factory FirebaseFailure.fromFirebaseFirestoreError(FirebaseException error) {
    switch (error.code) {
      case 'cancelled':
        return FirebaseFailure('The operation was canceled.');
      case 'unknown':
        return FirebaseFailure('An unknown error occurred.');
      case 'invalid-argument':
        return FirebaseFailure('Invalid argument provided.');
      case 'deadline-exceeded':
        return FirebaseFailure('The operation timed out.');
      case 'not-found':
        return FirebaseFailure('The requested document was not found.');
      case 'already-exists':
        return FirebaseFailure('A document with this ID already exists.');
      case 'permission-denied':
        return FirebaseFailure(
          'You don\'t have permission to perform this action.',
        );
      case 'resource-exhausted':
        return FirebaseFailure('Resource limits have been exceeded.');
      case 'failed-precondition':
        return FirebaseFailure('The operation was rejected.');
      case 'aborted':
        return FirebaseFailure('The operation was aborted.');
      case 'out-of-range':
        return FirebaseFailure(
          'The operation attempted to read past allowed range.',
        );
      case 'unimplemented':
        return FirebaseFailure('This operation is not implemented.');
      case 'internal':
        return FirebaseFailure('An internal error occurred.');
      case 'unavailable':
        return FirebaseFailure('The service is currently unavailable.');
      case 'data-loss':
        return FirebaseFailure(
          'Unrecoverable data loss or corruption occurred.',
        );
      case 'unauthenticated':
        return FirebaseFailure('User is not authenticated. Please sign in.');
      default:
        return FirebaseFailure('A database error occurred. Please try again.');
    }
  }
}
