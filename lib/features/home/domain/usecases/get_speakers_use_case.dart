import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/usecases/main_usecase.dart';
import 'package:quizdent/features/home/domain/entities/speaker_entity.dart';
import 'package:quizdent/features/home/domain/repo/events_repo.dart';

class GetSpeakersUseCase extends MainUseCase<List<SpeakerEntity>,void>{
  final EventsRepo eventsRepo;
  const GetSpeakersUseCase({required this.eventsRepo});
  @override
  Future<Either<Failure, List<SpeakerEntity>>> call({required void params}) async{
    return await eventsRepo.getSpeakers();
  }
  
}