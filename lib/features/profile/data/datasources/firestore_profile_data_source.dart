import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizdent/core/failure/firestore_failure.dart';
import 'package:quizdent/core/strings/strings_of_firebase.dart';
import 'package:quizdent/features/authentication/data/models/user_model.dart';
import 'package:quizdent/features/profile/data/datasources/main_profile_data_source.dart';

class FirestoreProfileDataSource extends MainProfileDataSource{
  final FirebaseFirestore firestore;
  FirestoreProfileDataSource({required this.firestore});

  @override
  Future<void> updateUserProfile({required UserModel userModel}) async {
    try {
      await firestore
          .collection(StringsOfFirebase.usersCollection)
          .doc(userModel.userId)
          .update(userModel.toJson());

    } on FirebaseException catch (e) {
      throw FirestoreFailure(rawErrorMessage: e.message);
    } catch (e) {
      throw FirestoreFailure(rawErrorMessage: e.toString());
    }
  }

}