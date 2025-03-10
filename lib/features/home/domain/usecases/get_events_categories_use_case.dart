import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/usecases/main_usecase.dart';
import 'package:quizdent/features/home/domain/repo/events_repo.dart';
import 'package:quizdent/features/home/domain/entities/event_category_entity.dart';

class GetEventsCategoriesUseCase extends MainUseCase<List<EventCategoryEntity>, void> {
  final EventsRepo eventsRepo;

  GetEventsCategoriesUseCase({required this.eventsRepo});

  @override
  Future<Either<Failure, List<EventCategoryEntity>>> call({required void params}) async {
    return await eventsRepo.getEventsCategories();
  }
}
