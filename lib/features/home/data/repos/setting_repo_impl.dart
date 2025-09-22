import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiservices_app/core/services/firebase_servieces.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/core/utils/fuilureHandler/firebase_failure.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/data/models/feedback_message_modal.dart';
import 'package:multiservices_app/features/home/data/repos/setting_repo.dart';

class SettingRepoImpl implements SettingRepo {
  final FirebaseServieces firebaseServieces;
  final FirebaseAuth auth;

  SettingRepoImpl({required this.firebaseServieces, required this.auth});
  @override
  Future<Either<FireFailure, dynamic>> sendFeedBackMessage({
    required FeedbackMessageModla feedbackMessage,
  }) async {
    try {
      var data = await firebaseServieces.addDoc(
        colecName: AppConstants.feedBackMessages,
        data: feedbackMessage.toJson(),
      );
      return right(dynamic);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthError(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<FireFailure, dynamic>> updateUserProfileData({
    required UserModal userModal,
  }) async {
    try {
      var data = await firebaseServieces.updateDoc(
        colecName: AppConstants.userColection,
        docId: auth.currentUser!.uid,
        data: userModal.toJson(),
      );
      return right(dynamic);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthError(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }
}
