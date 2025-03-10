import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizdent/core/failure/firestore_failure.dart';
import 'package:quizdent/core/strings/strings_of_firebase.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_home.dart';
import 'package:quizdent/features/home/data/datasources/main_event_data_source.dart';
import 'package:quizdent/features/home/data/models/event_category_model.dart';
import 'package:quizdent/features/home/data/models/event_model.dart';
import 'package:quizdent/features/home/data/models/speaker_model.dart';

class FireStoreDataSource extends MainEventDataSource {
  final FirebaseFirestore firestore;
  FireStoreDataSource({required this.firestore});

  @override
  Future<List<EventModel>> getEvents({required List<String> categories}) async {
    try {
      late QuerySnapshot querySnapshot;
      if (categories.length==1 && categories.first==StringsOfHome.filterChipAll){
        querySnapshot = await firestore
            .collection(StringsOfFirebase.eventsCollection).get();
      }else{
        querySnapshot = await firestore
            .collection(StringsOfFirebase.eventsCollection)
            .where(StringsOfFirebase.categoryIdColumnInEventsCollection, isEqualTo: categories)
            .get();
      }
      print('*'*50);
      print(querySnapshot.docs);
      return querySnapshot.docs
          .map((doc) => EventModel.fromJson(json: doc.data() as Map<String, dynamic>, id: doc.id))
          .toList();
    } on FirebaseException catch (e) {
      throw FirestoreFailure(rawErrorMessage: e.message);
    } catch (e) {
      throw FirestoreFailure(rawErrorMessage: e.toString());
    }
  }


  @override
  Future<List<EventCategoryModel>> getEventsCategories() async {
    try {
      QuerySnapshot querySnapshot =
      await firestore.collection(StringsOfFirebase.eventsCategoriesCollection).get();

      return querySnapshot.docs
          .map((doc) =>
          EventCategoryModel.fromJson(json: doc.data() as Map<String, dynamic>, id: doc.id))
          .toList();
    } on FirebaseException catch (e) {
      throw FirestoreFailure(rawErrorMessage: e.message);
    } catch (e) {
      throw FirestoreFailure(rawErrorMessage: e.toString());
    }
  }

  @override
  Future<List<SpeakerModel>> getSpeakers() async {
    try {
      QuerySnapshot querySnapshot =
      await firestore.collection(StringsOfFirebase.speakersCollection).get();

      return querySnapshot.docs
          .map((doc) => SpeakerModel.fromJson(
        json: doc.data() as Map<String, dynamic>,
        id: doc.id,
      ))
          .toList();
    } on FirebaseException catch (e) {
      throw FirestoreFailure(rawErrorMessage: e.message);
    } catch (e) {
      throw FirestoreFailure(rawErrorMessage: e.toString());
    }
  }



}
