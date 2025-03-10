import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/failure/repo_implementation_failure.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_home.dart';
import 'package:quizdent/core/strings/strings_of_error_codes.dart';
import 'package:quizdent/features/home/data/datasources/main_event_data_source.dart';
import 'package:quizdent/features/home/data/mappers/event_category_mapper.dart';
import 'package:quizdent/features/home/data/mappers/event_mapper.dart';
import 'package:quizdent/features/home/data/mappers/speaker_mapper.dart';
import 'package:quizdent/features/home/data/models/event_category_model.dart';
import 'package:quizdent/features/home/data/models/event_model.dart';
import 'package:quizdent/features/home/data/models/speaker_model.dart';
import 'package:quizdent/features/home/domain/entities/event_category_entity.dart';
import 'package:quizdent/features/home/domain/entities/speaker_entity.dart';
import 'package:quizdent/features/home/domain/repo/events_repo.dart';
import 'package:quizdent/features/home/domain/entities/event_entity.dart';

class EventsRepoImplem extends EventsRepo {
  final MainEventDataSource dataSource;
  EventsRepoImplem({required this.dataSource});

  @override
  Future<Either<Failure, List<EventEntity>>> getEvents({required List<String> categories}) async{
      try{
        List<EventModel> eventsData = await dataSource.getEvents(categories: categories);
        eventsData.map((event)=> EventMapper.toEntity(eventModel: event));
        return Right(eventsData);
      }catch(exception){
        return Left(
            RepoImplementationFailure(repoType: StringsOfErrorCodes.repoType ,errorMsg: exception.toString())
        );
      }
    }


  @override
  Future<Either<Failure, List<EventEntity>>> searchEvents({required String searchWords}) async {
    try {
      List<EventModel> allEvents = await dataSource.getEvents(categories: [StringsOfHome.filterChipAll]);
      List<EventModel> filteredEvents = allEvents.where((event) =>
      event.title.toLowerCase().contains(searchWords.toLowerCase()) ||
          event.description.toLowerCase().contains(searchWords.toLowerCase())
      ).toList();

      List<EventEntity> eventEntities = filteredEvents.map((event) => EventMapper.toEntity(eventModel: event)).toList();
      return Right(eventEntities);
    } catch (exception) {
      return Left(
        RepoImplementationFailure(
          repoType: StringsOfErrorCodes.repoType,
          errorMsg: exception.toString(),
        ),
      );
    }
  }



  @override
  Future<Either<Failure, List<EventCategoryEntity>>> getEventsCategories() async{
    try{
      List<EventCategoryModel> eventsCategoriesData  = await dataSource.getEventsCategories();
      eventsCategoriesData.map((eventCategory)=> EventCategoryMapper.toEntity(model: eventCategory));
      return Right(eventsCategoriesData);
    }catch(exception){
      return Left(
          RepoImplementationFailure(repoType: StringsOfErrorCodes.repoType,errorMsg: exception.toString())
      );
    }
  }

  @override
  Future<Either<Failure, List<SpeakerEntity>>> getSpeakers() async{
    try{
      List<SpeakerModel> speakersData  = await dataSource.getSpeakers();
      speakersData.map((speaker)=> SpeakerMapper.toEntity(model: speaker));
      return Right(speakersData);
    }catch(exception){
      return Left(
          RepoImplementationFailure(repoType: StringsOfErrorCodes.repoType,errorMsg: exception.toString())
      );
    }
  }



}