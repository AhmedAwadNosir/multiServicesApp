import 'package:dartz/dartz.dart';
import 'package:multiservices_app/core/utils/fuilureHandler/api_failure.dart';
import 'package:multiservices_app/core/utils/fuilureHandler/firebase_failure.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/data/models/feedback_message_modal.dart';

abstract class SettingRepo {
  Future<Either<FireFailure, dynamic>> updateUserProfileData({
    required UserModal userModal,
  });
  Future<Either<FireFailure, dynamic>> sendFeedBackMessage({
    required FeedbackMessageModla feedbackMessage,
  });
}
