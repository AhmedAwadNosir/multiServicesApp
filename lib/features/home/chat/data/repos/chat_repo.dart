import 'package:dartz/dartz.dart';
import 'package:multiservices_app/core/utils/fuilureHandler/firebase_failure.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/data/models/contac_modal.dart';
import 'package:multiservices_app/features/home/chat/data/models/message_modal.dart';

abstract class ChatRepo {
  Future<Either<FireFailure, List<UserModal>>> getUsers();
  Future<Either<FireFailure, dynamic>> addFriend({
    required UserModal friendData,
  });
  Future<Either<FireFailure, List<UserModal>>> getFriendReq();
  Future<Either<FireFailure, dynamic>> acceptFreindReq({
    required UserModal friendData,
  });
  Future<Either<FireFailure, dynamic>> deletFriendReq({
    required UserModal friendData,
  });
  Future<Either<FireFailure, List<UserModal>>> getFriends();

  Future<Either<FireFailure, dynamic>> sendMessage({
    required MessageModal messageModal,
    required UserModal reciverModal,
  });
  Future<Either<FireFailure, List<ContactModal>>> getAllContact();
  Future<Either<FireFailure, dynamic>> handleUserOnlineSatuslastSeenChatIn({
    required String reciverDocId,
  });
  Future<Either<FireFailure, dynamic>> handleUserOnlineSatusChatOut({
    required String reciverDocId,
  });
}
