import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_contact_us_screen.dart';
import 'package:quizdent/core/widgets/dialogs/show_my_dialog.dart';
import 'package:quizdent/core/widgets/my_loading_button.dart';
import 'package:quizdent/core/widgets/my_tff.dart';
import 'package:quizdent/features/support/presentation/manager/support_cubit.dart';
import 'package:quizdent/features/support/presentation/manager/support_states.dart';

class MessageForm extends StatelessWidget {
  const MessageForm({super.key});

  @override
  Widget build(BuildContext context) {
    final SupportCubit supportCubit = context.read<SupportCubit>();
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsOfContactUsScreen.yourMsgWord,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: Sizes.md),
            MyTff(
              label: StringsOfContactUsScreen.titleWord,
              controller: supportCubit.msgTitle,
              minLines: 2,
              maxLines: 3,
            ),
            const SizedBox(height: Sizes.md),
            MyTff(
              label: StringsOfContactUsScreen.msgWord,
              controller: supportCubit.msgBody,
              minLines: 4,
              maxLines: 6,
            ),
            const SizedBox(height: Sizes.lg),
            BlocConsumer<SupportCubit, SupportStates>(
            listener: (context, state) {
              if(state is SupportStateSuccess){
                ShowMyDialog.showInfoDialog(context: context, title: StringsOfContactUsScreen.msgSuccessTitle, message: StringsOfContactUsScreen.msgSuccessBody);
              }else if(state is SupportStateFailure) {
                ShowMyDialog.showInfoDialog(
                    context: context, title: StringsOfContactUsScreen.msgFailTitle, message: state.message);
              }
            },
            builder: (context, state) {
              return MyLoadingButton(
                  isLoading: state is SupportStateLoading,
                  title: StringsOfContactUsScreen.sendMsgWord,
                  onPressed: (){
                    supportCubit.submitUserMsg();
                  }
                );
            },
          ),
          ],
        ),
      ),
    );
  }
}
