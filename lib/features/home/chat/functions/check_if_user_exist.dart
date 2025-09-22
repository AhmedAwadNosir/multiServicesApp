import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multiservices_app/core/services/firebase_servieces.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';

Future<bool> isUserExist({required String userDocId}) async {
  FirebaseServieces firebaseServieces = FirebaseServieces();
  DocumentSnapshot snapshot = await firebaseServieces.getDoc(
    colecName: AppConstants.userColection,
    docId: userDocId,
  );
  return snapshot.exists;
}
