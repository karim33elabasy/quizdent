import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizdent/core/failure/firebase_authentication_failure.dart';
import 'package:quizdent/core/failure/firestore_failure.dart';
import 'package:quizdent/core/failure/general_auth_failure.dart';
import 'package:quizdent/core/strings/strings_of_errors.dart';
import 'package:quizdent/core/strings/strings_of_firebase.dart';
import 'package:quizdent/features/authentication/data/datasources/auth_repo_datasource.dart';
import 'package:quizdent/features/authentication/data/models/login_model.dart';
import 'package:quizdent/features/authentication/data/models/signup_model.dart';

class FirebaseAuthRepo extends AuthRepoDatasource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  FirebaseAuthRepo({required this.firebaseAuth, required this.firestore});

  @override
  Future<Map<String, dynamic>> login({required LoginModel loginModel}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: loginModel.email, password: loginModel.password);
      return await _getUserInfo(userId: firebaseAuth.currentUser!.uid);
    } on FirebaseAuthException catch (firebaseAuthException) {
      throw FirebaseAuthenticationFailure(
          rawErrorMessage: firebaseAuthException.message);
    } catch (e) {
      throw GeneralAuthFailure(errorMessage: e.toString());
    }
  }

  @override
  Future signup({required SignupModel signupModel}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: signupModel.email, password: signupModel.password);
      await _saveUserInfo(
        uid: firebaseAuth.currentUser!.uid,
        signupModel: signupModel
      );
    } on FirebaseAuthException catch (firebaseAuthException) {
      throw FirebaseAuthenticationFailure(
          rawErrorMessage: firebaseAuthException.message);
    } on FirestoreFailure catch (firestoreException) {
      throw FirestoreFailure(rawErrorMessage: firestoreException.errorMessage);
    } catch (e) {
      throw GeneralAuthFailure(errorMessage: e.toString());
    }
  }

  @override
  Future forgetPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (firebaseAuthException) {
      throw FirebaseAuthenticationFailure(
          rawErrorMessage: firebaseAuthException.message);
    } catch (e) {
      throw GeneralAuthFailure(errorMessage: e.toString());
    }
  }

  _saveUserInfo({required String uid, required SignupModel signupModel}) async {
    try {
      await firestore.collection(StringsOfFirebase.usersCollection).doc(
          uid).set(signupModel.toJson(), SetOptions(merge: true));
    } on FirestoreFailure catch (firestoreException) {
      throw FirestoreFailure(rawErrorMessage: firestoreException.errorMessage);
    } catch (e) {
      throw GeneralAuthFailure(errorMessage: e.toString(),
          errorCategory: StringsOfErrors.loginAuthError);
    }
  }

  Future<Map<String, dynamic>> _getUserInfo({required String userId}) async {
    try {
      var result = await firestore.collection(
          StringsOfFirebase.usersCollection).doc(userId).get();
      return result.data()!;
    } on FirestoreFailure catch (firestoreException) {
      throw FirestoreFailure(rawErrorMessage: firestoreException.errorMessage);
    } catch (e) {
      throw GeneralAuthFailure(errorMessage: e.toString(),
          errorCategory: StringsOfErrors.loginAuthError);
    }
  }
}