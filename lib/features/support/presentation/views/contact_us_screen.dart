import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_contact_us_screen.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:quizdent/features/support/presentation/views/widgets/message_form.dart';
import 'package:quizdent/features/support/presentation/views/widgets/user_info_section.dart';

class ContactUsScreen extends StatelessWidget {

  const ContactUsScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final user = context
        .read<AuthBloc>()
        .user!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(StringsOfContactUsScreen.contactUsScreenTitle, style: Theme
            .of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontSize: 22, color: AppColors.white),),
        backgroundColor: Theme.of(context).brightness == Brightness.dark? AppColors.black:AppColors.primary,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_rounded, color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Sizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInfoSection(name: '${user.firstName} ${user.lastName}',
                phone: user.phoneNumber,
                email: user.email),
            const SizedBox(height: Sizes.lg),
            const MessageForm(),
          ],
        ),
      ),
    );
  }
}