import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/features/home/chat/data/models/contac_modal.dart';

Stream<List<ContactModal>> getallcontactsStream() {
  final firbasefirestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  return firbasefirestore
      .collection(AppConstants.userColection)
      .doc(auth.currentUser!.uid)
      .collection(AppConstants.contactsSubColection)
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((doc) {
              final contact = ContactModal.fromJson(
                doc.data() as Map<String, dynamic>,
              );

              return contact;
            }).toList(),
      );
}
