import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quizdent/features/home/presentation/widgets/hot_offers_grid_view.dart';
import 'package:quizdent/features/home/presentation/widgets/products_list_view.dart';
import 'package:quizdent/features/home/presentation/widgets/products_page_view.dart';
import 'package:quizdent/features/home/presentation/widgets/section_title.dart';
import 'package:quizdent/features/home/presentation/widgets/side_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Variable of the locales I have :
    const Locale arLocale = Locale("ar","EG");
    const Locale enLocale = Locale("en","US");

    changeLocale(){
      // Function to change from the arabic to english language. It's excuted in the side menu
      setState(() {
        context.setLocale(context.locale == enLocale ? arLocale : enLocale);
      });

    }
    return Scaffold(
      drawer: SideMenu(changeLocale: changeLocale,),
      appBar: AppBar(
        title: Text(tr("appTitle"),style: const TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),

      // To avoid application screen to overlap system components
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Our products section :
            const SectionTitle(sectionTitle: "productsSectionTitle"),
            Expanded(child: ProductsPageView()),
            // Hot offers section :
            const SectionTitle(sectionTitle: "offersSectionTitle"),
            Expanded(child: HotOffersGridView()),
            // Hot products section :
            const SectionTitle(sectionTitle: "hotSectionTitle"),
            Expanded(child: ProductsListView()),
          ],
        ),
      ),
    );
  }
}
