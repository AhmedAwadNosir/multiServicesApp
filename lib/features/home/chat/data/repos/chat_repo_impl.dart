import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/core/services/firebase_servieces.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/core/utils/fuilureHandler/firebase_failure.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/data/models/contac_modal.dart';
import 'package:multiservices_app/features/home/chat/data/models/message_modal.dart';
import 'package:multiservices_app/features/home/chat/data/repos/chat_repo.dart';
import 'package:multiservices_app/features/home/functions/get_user_data.dart';

class ChatRepoImpl implements ChatRepo {
  final FirebaseServieces firebaseServieces;
  final FirebaseAuth auth;

  ChatRepoImpl({required this.firebaseServieces, required this.auth});
  @override
  Future<Either<FireFailure, dynamic>> acceptFreindReq({
    required UserModal friendData,
  }) async {
    try {
      UserModal userData = await getUserData();
      userData.docId = auth.currentUser!.uid;
      var data = await firebaseServieces.addSubColectionDocWithId(
        colecName: AppConstants.userColection,
        docId: auth.currentUser!.uid,
        subColecName: AppConstants.freindSubColection,
        data: friendData.toJson(),
        subcoldocId: friendData.docId,
        setOptionMerged: false,
      );
      await firebaseServieces.addSubColectionDocWithId(
        colecName: AppConstants.userColection,
        docId: friendData.docId!,
        subColecName: AppConstants.freindSubColection,
        data: userData.toJson(),
        subcoldocId: userData.docId,
        setOptionMerged: false,
      );
      await firebaseServieces.deleteSubColectionDoc(
        colecName: AppConstants.userColection,
        docId: friendData.docId!,
        subColecName: AppConstants.sendedFreindReqSubColection,
        subColecdocId: auth.currentUser!.uid,
      );
      deletFriendReq(friendData: friendData);
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
  Future<Either<FireFailure, dynamic>> addFriend({
    required UserModal friendData,
  }) async {
    UserModal userData = await getUserData();
    userData.docId = auth.currentUser!.uid;
    try {
      var data = await firebaseServieces.addSubColectionDocWithId(
        colecName: AppConstants.userColection,
        docId: friendData.docId!,
        subColecName: AppConstants.freindReqSubColection,
        data: userData.toJson(),
        subcoldocId: auth.currentUser!.uid,
        setOptionMerged: false,
      );
      await firebaseServieces.addSubColectionDocWithId(
        colecName: AppConstants.userColection,
        docId: auth.currentUser!.uid,
        subColecName: AppConstants.sendedFreindReqSubColection,
        data: friendData.toJson(),
        subcoldocId: friendData.docId,
        setOptionMerged: false,
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
  Future<Either<FireFailure, dynamic>> deletFriendReq({
    required UserModal friendData,
  }) async {
    try {
      var data = await firebaseServieces.deleteSubColectionDoc(
        colecName: AppConstants.userColection,
        docId: auth.currentUser!.uid,
        subColecName: AppConstants.freindReqSubColection,
        subColecdocId: friendData.docId!,
      );
      await firebaseServieces.deleteSubColectionDoc(
        colecName: AppConstants.userColection,
        docId: friendData.docId!,
        subColecName: AppConstants.sendedFreindReqSubColection,
        subColecdocId: auth.currentUser!.uid,
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
  Future<Either<FireFailure, List<UserModal>>> getFriendReq() async {
    try {
      var data = await firebaseServieces.getSubColectionDocs(
        colecName: AppConstants.userColection,
        docId: auth.currentUser!.uid,
        subColecName: AppConstants.freindReqSubColection,
      );
      List<UserModal> friendsReq = [];
      for (var doc in data.docs) {
        UserModal freindData;
        freindData = UserModal.fromJson(doc);
        freindData.docId = doc.id;
        friendsReq.add(freindData);
      }
      print(friendsReq);
      return right(friendsReq);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthError(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<FireFailure, List<UserModal>>> getFriends() async {
    try {
      var data = await firebaseServieces.getSubColectionDocs(
        colecName: AppConstants.userColection,
        docId: auth.currentUser!.uid,
        subColecName: AppConstants.freindSubColection,
      );
      List<UserModal> friends = [];
      for (var doc in data.docs) {
        UserModal freindData;
        freindData = UserModal.fromJson(doc);
        freindData.docId = doc.id;
        friends.add(freindData);
      }
      print(friends);
      return right(friends);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthError(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<FireFailure, List<UserModal>>> getUsers() async {
    try {
      var data = await firebaseServieces.getDocs(
        colecName: AppConstants.userColection,
      );
      var sendedFriendReqData = await firebaseServieces.getSubColectionDocs(
        colecName: AppConstants.userColection,
        docId: auth.currentUser!.uid,
        subColecName: AppConstants.sendedFreindReqSubColection,
      );
      Map<String, String> senedReq = {
        for (var doc in sendedFriendReqData.docs) doc.id: doc.id,
      };
      var FriendsData = await firebaseServieces.getSubColectionDocs(
        colecName: AppConstants.userColection,
        docId: auth.currentUser!.uid,
        subColecName: AppConstants.freindSubColection,
      );
      Map<String, String> friends = {
        for (var doc in FriendsData.docs) doc.id: doc.id,
      };
      var FriendsReqData = await firebaseServieces.getSubColectionDocs(
        colecName: AppConstants.userColection,
        docId: auth.currentUser!.uid,
        subColecName: AppConstants.freindReqSubColection,
      );
      Map<String, String> friendsReq = {
        for (var doc in FriendsReqData.docs) doc.id: doc.id,
      };
      List<UserModal> users = [];
      for (var doc in data.docs) {
        if (doc.id != auth.currentUser!.uid &&
            !senedReq.containsKey(doc.id) &&
            !friends.containsKey(doc.id) &&
            !friendsReq.containsKey(doc.id)) {
          UserModal userdata;
          userdata = UserModal.fromJson(doc);
          userdata.docId = doc.id;
          users.add(userdata);
        }
      }
      return right(users);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthError(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<FireFailure, dynamic>> sendMessage({
    required MessageModal messageModal,
    required UserModal reciverModal,
  }) async {
    try {
      UserModal myData = await getUserData();
      //get num of unseend message to reciver
      DocumentSnapshot snapshot = await firebaseServieces.getSubColectionDoc(
        colecName: AppConstants.userColection,
        docId: reciverModal.docId!,
        subColecName: AppConstants.contactsSubColection,
        subColecdocId: auth.currentUser!.uid,
      );
      int numOfNewMessages = 0;
      bool isReciverOnline = false;
      if (snapshot.exists) {
        numOfNewMessages = snapshot.get("numOfNewMessages");
        isReciverOnline = snapshot.get("isOnline");
      }

      // add message to chats
      var messageData = await firebaseServieces.addDoc(
        colecName: "chats",
        data: messageModal.toJson(),
      );
      // add reciver to my contact
      var senderNewContact = firebaseServieces.addSubColectionDocWithId(
        colecName: AppConstants.userColection,
        subColecName: AppConstants.contactsSubColection,
        docId: auth.currentUser!.uid,
        data:
            ContactModal(
              name: reciverModal.userName,
              image: reciverModal.profilImageLink,
              docId: reciverModal.docId!,
              lastMessageTime: Timestamp.now(),
              numOfNewMessages: 0,
              lastMessage: messageModal.messageContent,
              isOnline: isReciverOnline,
              chatRoom: messageModal.chatRoom,
            ).toJson(),
        setOptionMerged: true,
        subcoldocId: reciverModal.docId,
      );
      //add sender to reciver contacts
      //check if it online num of new message =0;
      var reciverNewContact = firebaseServieces.addSubColectionDocWithId(
        colecName: AppConstants.userColection,
        subColecName: AppConstants.contactsSubColection,
        docId: reciverModal.docId!,
        data:
            ContactModal(
              name: myData.userName,
              image: myData.profilImageLink,
              docId: auth.currentUser!.uid,
              lastMessageTime: Timestamp.now(),
              numOfNewMessages: isReciverOnline ? 0 : ++numOfNewMessages,
              lastMessage: messageModal.messageContent,
              isOnline: true,
              chatRoom: messageModal.chatRoom,
            ).toJson(),
        setOptionMerged: true,
        subcoldocId: auth.currentUser!.uid,
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
  Future<Either<FireFailure, List<ContactModal>>> getAllContact() async {
    try {
      var data = await firebaseServieces.getSubColectionDocs(
        colecName: AppConstants.userColection,
        docId: auth.currentUser!.uid,
        subColecName: AppConstants.contactsSubColection,
      );
      List<ContactModal> contacts = [];
      for (var doc in data.docs) {
        contacts.add(ContactModal.fromJson(doc));
      }
      return right(contacts);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthError(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }
}
