import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_event_screen.dart';
import 'package:quizdent/core/strings/strings_of_errors.dart';
import 'package:quizdent/core/widgets/dialogs/show_my_dialog.dart';
import 'package:quizdent/core/widgets/my_loading_button.dart';
import 'package:quizdent/core/widgets/section_title.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:quizdent/features/home/domain/entities/event_entity.dart';
import 'package:quizdent/features/home/presentation/managers/manage_events/manage_events_cubit.dart';
import 'package:quizdent/features/home/presentation/managers/manage_events/manage_events_states.dart';
import 'package:quizdent/features/home/presentation/widgets/body_of_event_screen.dart';
import 'package:quizdent/features/home/presentation/widgets/speakers_section.dart';

class EventScreen extends StatelessWidget {
  final EventEntity eventEntity;
  const EventScreen({super.key, required this.eventEntity});

  @override
  Widget build(BuildContext context) {
    final ManageEventsCubit manageEventsCubit = context.read<ManageEventsCubit>();
    final AuthBloc authBloc = context.read<AuthBloc>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(StringsOfEventsScreen.eventScreenTitle,style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22,color: AppColors.white),),
        backgroundColor: Theme.of(context).brightness == Brightness.dark? AppColors.black:AppColors.primary,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_rounded,color: Colors.white,)),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.share,color: AppColors.white,))
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          vertical: Sizes.sm,
          horizontal: Sizes.sm,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  BodyOfEventScreen(eventEntity: eventEntity,),
                  const SectionTitle(sectionTitle: StringsOfEventsScreen.speakersTitle),
                  SpeakersSection(eventEntity: eventEntity),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            BlocConsumer<ManageEventsCubit, ManageEventsStates>(
              listener: (context, state) {
                if(state is ManageEventsStatesFailure){
                  ShowMyDialog.showErrorDialog(context: context, title: StringsOfErrors.enrollError, message: state.message);
                }else if(state is ManageEventsStatesSuccess){
                  if(authBloc.user!.favEvents.contains(eventEntity.id)){
                    ShowMyDialog.showSuccessDialog(context: context, title: StringsOfEventsScreen.enrollSuccessTitle, message: StringsOfEventsScreen.enrollSuccessMessage);
                  }else{
                    ShowMyDialog.showSuccessDialog(context: context, title: StringsOfEventsScreen.unrollSuccessTitle, message: StringsOfEventsScreen.unrollSuccessMessage);
                  }
                }
              },
              builder: (context, state) {
                bool isEnrolled = authBloc.user!.favEvents.contains(eventEntity.id);
                return MyLoadingButton(
                  isLoading: state is ManageEventsStatesLoading,
                  title: isEnrolled? StringsOfEventsScreen.unrollMeWord:StringsOfEventsScreen.enrollBtn,
                  onPressed: (){
                    List<String> updatedFavEvents = authBloc.user!.favEvents;
                    isEnrolled?
                        updatedFavEvents.remove(eventEntity.id):
                        updatedFavEvents.add(eventEntity.id);

                    final newUserEntity = authBloc.user!.copyWith(favEvents: updatedFavEvents);
                    manageEventsCubit.updateUserData(userEntity: newUserEntity);
                  }
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
