import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/features/home/presentation/widgets/home_screen_tabs/tabs_list.dart';
import 'package:quizdent/features/home/presentation/widgets/tff_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: homeTabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: AppColors.primary,
          title: const TffAppBar(),
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: homeTabs.map((item)=>Tab(text: item.title,)).toList(),
          ),
        ),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(
              vertical: Sizes.md,
              horizontal: Sizes.md,
            ),
          child: TabBarView(
            children: homeTabs.map((item)=> item.body).toList(),
          ),
        ),
      ),
    );
  }
}