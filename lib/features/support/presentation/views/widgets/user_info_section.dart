import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_contact_us_screen.dart';
import 'package:quizdent/features/support/presentation/views/widgets/build_info_row.dart';

class UserInfoSection extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  const UserInfoSection({super.key, required this.name, required this.phone, required this.email});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.md),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsOfContactUsScreen.yourInfoWord,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: Sizes.md),
            BuildInfoRow(label: StringsOfContactUsScreen.nameWord,value: name),
            BuildInfoRow(label: StringsOfContactUsScreen.emailWord,value: email),
            BuildInfoRow(label: StringsOfContactUsScreen.phoneWord,value: phone),
          ],
        ),
      ),
    );
  }
}
