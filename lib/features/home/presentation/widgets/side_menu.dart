import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final Function changeLocale;
  const SideMenu({super.key, required this.changeLocale});

  @override
  Widget build(BuildContext context) {
    bool isEnglish = context.locale.languageCode == 'en';
    return Container(
      width: MediaQuery.sizeOf(context).width*0.5,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(isEnglish? 'تغيير اللغة':'Change Language'),
            subtitle: Text(isEnglish? 'تغيير للغة العربية':'Change to English'),
            onTap: (){
              // Executing the home screen function to change the locale.
              changeLocale();
            },
          )
        ],
      ),
    );
  }
}
