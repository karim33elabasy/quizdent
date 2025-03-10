import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_home.dart';
import 'package:quizdent/features/home/presentation/managers/events_cubit/events_cubit.dart';

class TffSearchEvents extends StatefulWidget {
  const TffSearchEvents({super.key});

  @override
  TffSearchEventsState createState() => TffSearchEventsState();
}

class TffSearchEventsState extends State<TffSearchEvents> {
  Timer? _debounce;
  late EventsCubit eventsCubit;
  void _onSearchChanged(String query) {
    setState(() {});
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      eventsCubit.searchEvents();
    });
  }

  @override
  void initState() {
    super.initState();
    eventsCubit = context.read<EventsCubit>();
  }
  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: eventsCubit.searchTEC,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: StringsOfHome.searchTffSearch,
        prefixIcon: const Icon(Icons.search, color: Colors.blue),
        suffixIcon: eventsCubit.searchTEC.text.isNotEmpty? IconButton(onPressed: (){eventsCubit.searchTEC.clear();eventsCubit.getEvents();}, icon: const Icon(Icons.cancel,color: Colors.black54,)):null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.zero,
      ),
      onChanged: _onSearchChanged,
    );
  }
}
