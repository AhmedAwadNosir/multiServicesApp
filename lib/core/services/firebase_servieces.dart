import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServieces {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //----------------------------------------
  //firebase Auth
  //to create user with email and password
  //---------------------------------------
  Future<dynamic> signUpUserWithEmailPassword({
    required String emailAddress,
    required String password,
  }) async {
    final credintial = await _auth.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    return credintial;
  }

  //to sign in user with email and password
  Future<UserCredential> signInUserWithEmailPassword({
    required String emailAddress,
    required String password,
  }) async {
    final UserCredential credintial = await _auth.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    return credintial;
  }
  //to sign in user with Google

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //this for sign out user from firebase
  Future<void> signOut() async {
    await _auth.signOut();
  }

  //this for send email verification
  Future<void> sendEmailVerification() async {
    if (_auth.currentUser != null) {
      _auth.currentUser!.sendEmailVerification();
      log("EmailVerificationSended");
    }
  }

  //check Email is verfied or not
  Future<bool> emailIsVerified({required UserCredential userCredintial}) async {
    return userCredintial.user?.emailVerified ?? false;
  }

  // send ressetPassword Email

  Future<void> sendRessetPasswordEmail({required String emialAddress}) async {
    await _auth.sendPasswordResetEmail(email: emialAddress);
  }
  // this Methods it firebase options for cloction
  ////////////////////////////////////////////////

  //addDoc to colection and docid is defiened by firebase (add Method)
  Future<void> addDoc({
    required String colecName,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(colecName).add(data);
  }

  //setDoc to colection and docId id defineIt usualy is user.Uid
  //if doc doesn`t exist it added and if exist it updated delet old data and put new data
  //if setOption merged true field that not updated dont deleted
  Future<void> addDocwithId({
    required String colecName,
    required Map<String, dynamic> data,
    @required String? docId,
    @required bool? setOptionMerged,
  }) async {
    await _firestore
        .collection(colecName)
        .doc(docId)
        .set(data, SetOptions(merge: setOptionMerged ?? false));
  }

  // get all docs in required CloctionName
  Future<QuerySnapshot> getDocs({required String colecName}) async {
    QuerySnapshot snapshot = await _firestore.collection(colecName).get();
    return snapshot;
  }

  // get all docs in required ColectionName whith filed == value
  Future<QuerySnapshot> getDocsWhereFiledEqualValue({
    required String colecName,
    required String filed,
    required String value,
  }) async {
    QuerySnapshot snapshot =
        await _firestore
            .collection(colecName)
            .where(filed, isEqualTo: value)
            .get();
    return snapshot;
  }

  //get specific doc data with it doc id
  Future<DocumentSnapshot> getDoc({
    required String colecName,
    required String docId,
  }) async {
    DocumentSnapshot docSnapshot =
        await _firestore.collection(colecName).doc(docId).get();
    return docSnapshot;
  }

  // update Doc with it DocId
  Future<void> updateDoc({
    required String colecName,
    required Map<String, dynamic> data,
    required String docId,
  }) async {
    await _firestore.collection(colecName).doc(docId).update(data);
  }

  //delet Doc with it DocId
  Future<void> deleteDoc({
    required String colecName,
    required String docId,
  }) async {
    await _firestore.collection(colecName).doc(docId).delete();
  }
  //------------------------------------------------------------------------------------------------
  // this Methods it firebase options for subColection
  ////////////////////////////////////////////////////

  //addDoc to  subcolection of coliction and docid is defiened by firebase (add Method)
  Future<void> addSubColectionDoc({
    required String colecName,
    required String subColecName,
    required Map<String, dynamic> data,
    required String docId,
  }) async {
    await _firestore
        .collection(colecName)
        .doc(docId)
        .collection(subColecName)
        .add(data);
  }

  //setDoc to subcolection of coliction and docId id defineIt usualy is user.Uid
  //if doc doesn`t exist it added and if exist it updated delet old data and put new data
  //if setOption merged true field that not updated dont deleted
  Future<void> addSubColectionDocWithId({
    required String colecName,
    required String subColecName,
    required String docId,
    required Map<String, dynamic> data,
    @required String? subcoldocId,
    @required bool? setOptionMerged,
  }) async {
    await _firestore
        .collection(colecName)
        .doc(docId)
        .collection(subColecName)
        .doc(subcoldocId)
        .set(data, SetOptions(merge: setOptionMerged));
  }

  // get all docs in required subcolection of coliction
  Future<QuerySnapshot> getSubColectionDocs({
    required String colecName,
    required String docId,
    required String subColecName,
  }) async {
    QuerySnapshot snapshot =
        await _firestore
            .collection(colecName)
            .doc(docId)
            .collection(subColecName)
            .get();
    return snapshot;
  }

  // get all docs in required ColectionName whith filed == value
  Future<QuerySnapshot> getSubColectionDocsWhereFiledEqualValue({
    required String colecName,
    required String docId,
    required String subColecName,
    required String filed,
    required String value,
  }) async {
    QuerySnapshot snapshot =
        await _firestore
            .collection(colecName)
            .doc(docId)
            .collection(subColecName)
            .where(filed, isEqualTo: value)
            .get();
    return snapshot;
  }

  //get specific doc data with it doc id
  Future<DocumentSnapshot> getSubColectionDoc({
    required String colecName,
    required String docId,
    required String subColecName,
    required String subColecdocId,
  }) async {
    DocumentSnapshot docSnapshot =
        await _firestore
            .collection(colecName)
            .doc(docId)
            .collection(subColecName)
            .doc(subColecdocId)
            .get();
    return docSnapshot;
  }

  // update Doc with it DocId
  Future<void> updateSubColectDoc({
    required String colecName,
    required String docId,
    required String subColecName,
    required String subColecdocId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(colecName)
        .doc(docId)
        .collection(subColecName)
        .doc(subColecdocId)
        .update(data);
  }

  //delet Doc with it DocId
  Future<void> deleteSubColectionDoc({
    required String colecName,
    required String docId,
    required String subColecName,
    required String subColecdocId,
  }) async {
    await _firestore
        .collection(colecName)
        .doc(docId)
        .collection(subColecName)
        .doc(subColecdocId)
        .delete();
  }

  //----------------------------------------------------------------------------
  //Explain some points in firebase with Examples
  //----------------------------------------------------------------------------
  //1-firebase(filtiring):firestorInstance.path.where(field(String),codtion).get()
  /////////////////////////////////////////////////////////////////////////////////
  //condtion
  //isEqualto:10 ==10
  //isNotEqualTo:10 !=10
  //isGraterthan:10 >10
  //isGreaterThanOrEqualTo:10 >=10
  //isLessThan :10 <10
  //isLessThanOrEqualTo :10 <=10
  //whereIn [10,20,30] : contain value in this arry
  //whereNotIn [10,20,30] :contain any values not in this array
  //arrayContains[10,20]  field is arry contains this values all
  //arrayContainsAny[10,20,30] field is arry contains any of this arry value
  //====================================================
  //notice that the value must be of the same type of field
  //////////////////////////////////////////////////////////
  Future<QuerySnapshot> getSubColectionDocsWhereFiledConddtionValue({
    required String colecName,
    required String docId,
    required String subColecName,
    required String filed,
    required String value,
  }) async {
    QuerySnapshot snapshot =
        await _firestore
            .collection(colecName)
            .doc(docId)
            .collection(subColecName)
            .where(filed, isGreaterThan: 10)
            .get();
    return snapshot;
  }
  //---------------------------------------------------
  //2-firebase(orderBy) firestoreInsance.path.orderBy("field",decinding:false).condtion([value of condtion]).limit[1].get() // retun on result
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //decinding  by dedfult false from lower to higher if it true it reverse condtion like this form > to <
  //condtion
  //startAt([10]) value>=10
  //startAfter([10]) value>10
  //end([10]) value <=10
  //endBefore([10]) value<10

  Future<QuerySnapshot> getSubColectionDocsOrderByCondtionandLimitRuslt({
    required String colecName,
    required String docId,
    required String subColecName,
    required String filed,
    required String value,
  }) async {
    QuerySnapshot snapshot =
        await _firestore
            .collection(colecName)
            .doc(docId)
            .collection(subColecName)
            .orderBy('note', descending: false)
            .startAt([10])
            .get();
    return snapshot;
  }

  //////////////////////////////////////////////////////////////////////////////
  //3-transaction in finantial apps when you want to update falue
  // you must reed last value and update this value this made by transaction
  //transaction(ReedLastData then writ New Data)
  //---------------------------------------------------------------------------
  // this is only example
  Future<void> updateSubColectDocByTransaction({
    required String colecName,
    required String docId,
    required String subColecName,
    required String subColecdocId,
    required Map<String, dynamic> data,
  }) async {
    //1- define the path of the doc that be updated
    DocumentReference docPath = _firestore
        .collection(colecName)
        .doc(docId)
        .collection(subColecName)
        .doc(subColecdocId);
    //2-create transaction(read then Write)
    _firestore.runTransaction((transaction) async {
      //1-read last data
      DocumentSnapshot snapshot = await docPath.get();
      if (snapshot.exists) {
        var lastData = snapshot.data();
        if (lastData is Map<String, dynamic>) {
          int mony = lastData["mony"] + 100; //updateValue
          transaction.update(docPath, {"mony": mony}); //write
        }
      }
    });
  }
}
