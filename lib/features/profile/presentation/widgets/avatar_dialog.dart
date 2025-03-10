import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:random_avatar/random_avatar.dart';

class AvatarGeneratorDialog extends StatefulWidget {
  final String initialSeed;

  const AvatarGeneratorDialog({Key? key, required this.initialSeed}) : super(key: key);

  @override
  _AvatarGeneratorDialogState createState() => _AvatarGeneratorDialogState();
}

class _AvatarGeneratorDialogState extends State<AvatarGeneratorDialog> {
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
      _avatarSeed = DateTime.now().toString(); // Generate a new seed based on the current time
      _seedController.text = _avatarSeed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close Button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            // Title
            Text(
              "Generate Your Avatar",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
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
            const SizedBox(height: 20),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Cancel Button
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                // Save Button
                SizedBox(
                  width: 100, // Constrain the width of the button
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, _avatarSeed); // Return the new seed
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Save"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}