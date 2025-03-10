import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/usecases/main_usecase.dart';
import 'package:quizdent/features/home/domain/repo/events_repo.dart';
import 'package:quizdent/features/home/domain/entities/event_entity.dart';

class GetEventsUseCase extends MainUseCase<List<EventEntity>,List<String>>{
  final EventsRepo eventsRepo;
  GetEventsUseCase({required this.eventsRepo});

  @override
  Future<Either<Failure, List<EventEntity>>> call({required List<String> params}) async{
    return await eventsRepo.getEvents(categories: params);
  }

}