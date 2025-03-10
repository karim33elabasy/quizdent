import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_home.dart';
import 'package:quizdent/features/home/domain/entities/event_category_entity.dart';
import 'package:quizdent/features/home/presentation/managers/events_categories_cubit/events_categories_cubit.dart';
import 'package:quizdent/features/home/presentation/managers/events_categories_cubit/events_ctegories_states.dart';
import 'package:quizdent/features/home/presentation/widgets/one_filter_chip.dart';

class FilterChipsStates extends StatefulWidget {
  const FilterChipsStates({super.key});

  @override
  State<FilterChipsStates> createState() => _FilterChipsStatesState();
}

class _FilterChipsStatesState extends State<FilterChipsStates> {

  rebuildFilterChips(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventsCategoriesCubit,EventsCategoriesStates>(
      builder: (context,state){
        if(state is EventsCategoriesStatesSuccess){
          return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
              itemBuilder: (context,counter){
                if(counter == 0 ) {
                  return OneFilterChip(
                  rebuildFilterChips: rebuildFilterChips,
                  eventCategoryEntity: EventCategoryEntity(id: StringsOfHome.filterChipAll, title: StringsOfHome.filterChipAll, description: StringsOfHome.filterChipAll, createdAt: DateTime.now(), createdBy: "superUser"));
                }
                return OneFilterChip(
                  rebuildFilterChips: rebuildFilterChips,
                  eventCategoryEntity: state.eventsCategories[counter],);
              },
              separatorBuilder: (context,counter)=> const SizedBox(width: 15,),
              itemCount: state.eventsCategories.length
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      listener: (context,state){

      }
    );
  }
}
