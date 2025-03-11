import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_profile_screen.dart';
import 'package:quizdent/core/widgets/dialogs/my_dialog.dart';
import 'package:quizdent/core/widgets/my_button.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_bloc.dart';
import 'package:quizdent/features/profile/presentation/manager/profile_bloc/profile_events.dart';
import 'package:random_avatar/random_avatar.dart';

class AvatarGeneratorDialog extends StatefulWidget {
  final String initialSeed;
  const AvatarGeneratorDialog({super.key, required this.initialSeed});

  @override
  AvatarGeneratorDialogState createState() => AvatarGeneratorDialogState();
}

class AvatarGeneratorDialogState extends State<AvatarGeneratorDialog> {
  late String _avatarSeed;
  late TextEditingController _seedController;

  @override
  void initState() {
    super.initState();
    _avatarSeed = widget.initialSeed;
    _seedController = TextEditingController(text: _avatarSeed);
  }

  @override
  void dispose() {
    _seedController.dispose();
    super.dispose();
  }

  void _generateRandomAvatar() {
    setState(() {
      _avatarSeed = DateTime.now().toString();
      _seedController.text = _avatarSeed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyDialog(
      title: StringsOfProfileScreen.generateAvatar,
      content: Column(
        children: [
          // Avatar Preview
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepPurple, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: RandomAvatar(
                _avatarSeed,
                height: 120,
                width: 120,
              ),
            ),
          ),
          const SizedBox(height: Sizes.lg),
          // Text Field for Custom Seed
          TextField(
            controller: _seedController,
            decoration: InputDecoration(
              labelText: "Enter a custom seed",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.edit, color: AppColors.primary),
              suffixIcon: IconButton(
                icon: const Icon(Icons.refresh, color: AppColors.primary),
                onPressed: _generateRandomAvatar,
              ),
            ),
            onChanged: (value) {
              setState(() {
                _avatarSeed = value.isNotEmpty ? value : widget.initialSeed;
              });
            },
          ),
          const SizedBox(height: Sizes.lg,),
          MyButton(
            onPressed: (){
              context.read<ProfileBloc>().currentUserDataToEdit['profilePicture']=_avatarSeed;
              context.read<ProfileBloc>().add(ProfileEventsUpdateSettingsUI());
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