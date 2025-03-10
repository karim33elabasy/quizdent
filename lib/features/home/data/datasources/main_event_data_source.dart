import 'package:quizdent/features/home/data/models/event_category_model.dart';
import 'package:quizdent/features/home/data/models/event_model.dart';
import 'package:quizdent/features/home/data/models/speaker_model.dart';

abstract class MainEventDataSource {
  Future<List<EventModel>> getEvents({required List<String> categories});
  Future<List<EventCategoryModel>> getEventsCategories();
  Future<List<SpeakerModel>> getSpeakers();
}