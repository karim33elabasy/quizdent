import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_profile_screen.dart';
import 'package:quizdent/core/variables_and_enums/enums.dart';
import 'package:quizdent/core/widgets/dialogs/my_dialog.dart';
import 'package:quizdent/core/widgets/my_button.dart';

class ChangeLanguageDialog extends StatefulWidget {
  const ChangeLanguageDialog({super.key});

  @override
  ChangeLanguageDialogState createState() => ChangeLanguageDialogState();
}

class ChangeLanguageDialogState extends State<ChangeLanguageDialog> {
  LangPref selectedLang = LangPref.en;

  @override
  Widget build(BuildContext context) {
    return MyDialog(
      title: StringsOfProfileScreen.changeAppLang,
      content: Column(
        mainAxisSize: MainAxisSize.min, // Use min to fit the content
        children: [
          // Dropdown for Language Selection
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepPurple, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButton<LangPref>(
              value: selectedLang,
              onChanged: (LangPref? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedLang = newValue;
                  });
                }
              },
              items: LangPref.values.map((LangPref lang) {
                return DropdownMenuItem<LangPref>(
                  value: lang,
                  child: Text(
                    lang.toString().split('.').last,
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              isExpanded: true, // Ensure the dropdown takes full width
              underline: const SizedBox(), // Remove the default underline
            ),
          ),
          const SizedBox(height: Sizes.lg,),
          MyButton(
              onPressed: (){
                Navigator.pop(context);
              },
              title: StringsOfProfileScreen.saveWord,
              isBlue: true
          )
        ],
      ),
    );
  }
}