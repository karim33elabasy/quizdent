import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/features/home/domain/entities/event_category_entity.dart';
import 'package:quizdent/features/home/domain/entities/event_entity.dart';
import 'package:quizdent/features/home/domain/entities/speaker_entity.dart';

abstract class EventsRepo{
  Future<Either<Failure,List<EventEntity>>> getEvents({required List<String> categories});
  Future<Either<Failure,List<EventEntity>>> searchEvents({required String searchWords});
  Future<Either<Failure,List<EventCategoryEntity>>> getEventsCategories();
  Future<Either<Failure,List<SpeakerEntity>>> getSpeakers();
}