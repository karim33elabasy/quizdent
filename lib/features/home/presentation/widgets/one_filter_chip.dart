import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/features/home/domain/entities/event_category_entity.dart';
import 'package:quizdent/features/home/presentation/managers/events_cubit/events_cubit.dart';

class OneFilterChip extends StatefulWidget {
  final EventCategoryEntity eventCategoryEntity;
  final void Function() rebuildFilterChips;

  const OneFilterChip({
    super.key,
    required this.eventCategoryEntity,
    required this.rebuildFilterChips,
  });

  @override
  State<OneFilterChip> createState() => _OneFilterChipState();
}

class _OneFilterChipState extends State<OneFilterChip> {
  @override
  Widget build(BuildContext context) {
    final eventsCubit = context.read<EventsCubit>();
    final bool isSelected = eventsCubit.categoriesFilter.contains(widget.eventCategoryEntity.id);

    return FilterChip(
      label: Text(widget.eventCategoryEntity.title),
      selected: isSelected,
      onSelected: (bool value) {
        if (value) {
          eventsCubit.addCategoryFilter(widget.eventCategoryEntity.id);
        } else {
          eventsCubit.removeCategoryFilter(widget.eventCategoryEntity.id);
        }
        widget.rebuildFilterChips();
      },
    );
  }
}
