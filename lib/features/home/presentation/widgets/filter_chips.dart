import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/strings_of_home.dart';

class FilterChips extends StatefulWidget {
  const FilterChips({super.key});

  @override
  State<FilterChips> createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {
  bool check = true;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  bool check5 = false;
  bool check6 = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: Sizes.sm,
        children: [
          FilterChip(
            label: const Text(StringsOfHome.filterChipAll),
            onSelected: (value){setState(() {check = value;});},
            selected: check,
          ),
          FilterChip(
            label: const Text("Night Movie"),
            onSelected: (value){setState(() {check2 = value;});},
            selected: check2,
          ),
          FilterChip(
            label: const Text("Marathons"),
            onSelected: (value){setState(() {check3 = value;});},
            selected: check3,
          ),
          FilterChip(
            label: const Text("English Lessons"),
            onSelected: (value){setState(() {check4 = value;});},
            selected: check4,
          ),
          FilterChip(
            label: const Text("Discussions"),
            onSelected: (value){setState(() {check5 = value;});},
            selected: check5,
          ),
          FilterChip(
            label: const Text("Courses"),
            onSelected: (value){setState(() {check6 = value;});},
            selected: check6,
          ),
        ],
      ),
    );
  }
}
