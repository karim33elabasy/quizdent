import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizdent/core/failure/firestore_failure.dart';
import 'package:quizdent/core/strings/strings_of_firebase.dart';
import 'package:quizdent/features/support/data/data_source/main_support_data_source.dart';
import 'package:quizdent/features/support/data/model/user_msg_model.dart';

class FirestoreSupportDataSource implements MainSupportDataSource {
  final FirebaseFirestore firestore;
  FirestoreSupportDataSource({required this.firestore});

  @override
  Future<void> submitUserMsg({required UserMsgModel userMsgModel}) async {
    try {
      await firestore
          .collection(StringsOfFirebase.userMsgCollection)
          .add(userMsgModel.toJson());
    } on FirebaseException catch (e) {
      throw FirestoreFailure(rawErrorMessage: e.message);
    } catch (e) {
      throw FirestoreFailure(rawErrorMessage: e.toString());
    }
  }
}