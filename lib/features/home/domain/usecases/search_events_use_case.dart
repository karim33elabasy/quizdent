import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/usecases/main_usecase.dart';
import 'package:quizdent/features/home/domain/entities/event_entity.dart';
import 'package:quizdent/features/home/domain/repo/events_repo.dart';

class SearchEventsUseCase implements MainUseCase<List<EventEntity>, String> {
  final EventsRepo eventsRepo;

  SearchEventsUseCase({required this.eventsRepo});

  @override
  Future<Either<Failure, List<EventEntity>>> call({required String params}) async {
    return eventsRepo.searchEvents(searchWords: params);
  }
}
