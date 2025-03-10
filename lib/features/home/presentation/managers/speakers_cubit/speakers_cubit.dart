import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/features/home/domain/usecases/get_speakers_use_case.dart';
import 'speakers_states.dart';

class SpeakersCubit extends Cubit<SpeakersStates> {
  final GetSpeakersUseCase getSpeakersUseCase;

  SpeakersCubit({required this.getSpeakersUseCase}) : super(SpeakersStatesInitial());

  Future<void> getSpeakers() async {
    emit(SpeakersStatesLoading());
    var result = await getSpeakersUseCase.call(params: null);
    result.fold(
          (error) => emit(SpeakersStatesFailure(errorMessage: error.errorMessage)),
          (speakers) => emit(SpeakersStatesSuccess(speakers: speakers)),
    );
  }
}
