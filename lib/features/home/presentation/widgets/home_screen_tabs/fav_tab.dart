import 'package:flutter/material.dart';
import 'package:quizdent/features/home/presentation/presentation_models/default_home_tab.dart';

class FavTab extends StatelessWidget {
  const FavTab ({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultHomeTab(body: Center(child: Text("Favourites Screen")));
  }
}
