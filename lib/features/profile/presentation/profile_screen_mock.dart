import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';

class ProfileScreen extends StatefulWidget {
  final UserEntity user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserEntity _user;
  late Map<String, bool> _notificationPreferences;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _passwordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _user = widget.user;
    _notificationPreferences = {
      for (var preference in _user.notificationPreferences) preference: true
    };
    _firstNameController = TextEditingController(text: _user.firstName);
    _lastNameController = TextEditingController(text: _user.lastName);
    _emailController = TextEditingController(text: _user.email);
    _phoneNumberController = TextEditingController(text: _user.phoneNumber);
    _passwordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _generateNewAvatar() {
    setState(() {
      // Regenerate the avatar by updating the user ID (or any unique value)
      _user = _user.copyWith(userId: DateTime.now().toString());
    });
  }

  Future<void> _saveChanges() async {
    // Update user data
    final updatedUser = _user.copyWith(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      phoneNumber: _phoneNumberController.text,
      notificationPreferences: _notificationPreferences.keys
          .where((key) => _notificationPreferences[key] == true)
          .toList(),
    );

    // Save logic (e.g., API call or local storage)
    // await saveUserData(updatedUser);

    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Changes saved successfully!')),
    );
  }

  Future<void> _confirmSaveChanges() async {
    final shouldSave = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Save Changes?'),
        content: const Text('Do you want to save your changes?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (shouldSave == true) {
      await _saveChanges();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Settings'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _confirmSaveChanges,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Section
            Center(
              child: Column(
                children: [
                  RandomAvatar(
                    _user.userId,
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: _generateNewAvatar,
                    child: const Text(
                      'Generate New Avatar',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // User Information Section
            _buildSectionHeader('Personal Information'),
            MyTff(
              label: 'First Name',
              controller: _firstNameController,
            ),
            MyTff(
              label: 'Last Name',
              controller: _lastNameController,
            ),
            MyTff(
              label: 'Email',
              controller: _emailController,
            ),
            MyTff(
              label: 'Phone Number',
              controller: _phoneNumberController,
            ),
            const SizedBox(height: 20),

            // Change Password Section
            _buildSectionHeader('Change Password'),
            MyTff(
              label: 'Current Password',
              controller: _passwordController,
              obscureText: true,
            ),
            MyTff(
              label: 'New Password',
              controller: _newPasswordController,
              obscureText: true,
            ),
            MyTff(
              label: 'Confirm New Password',
              controller: _confirmPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: 20),

            // Notification Preferences Section
            _buildSectionHeader('Notification Preferences'),
            ..._notificationPreferences.keys.map((preference) {
              return CheckboxListTile(
                title: Text(preference),
                value: _notificationPreferences[preference],
                onChanged: (value) {
                  setState(() {
                    _notificationPreferences[preference] = value ?? false;
                  });
                },
                secondary: const Icon(Icons.notifications, color: Colors.deepPurple),
              );
            }).toList(),
            const SizedBox(height: 20),

            // App Settings Section
            _buildSectionHeader('App Settings'),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
              secondary: const Icon(Icons.dark_mode, color: Colors.deepPurple),
            ),
            ListTile(
              leading: const Icon(Icons.language, color: Colors.deepPurple),
              title: const Text('Language Preference'),
              subtitle: Text(_user.langPref.toString().split('.').last),
              onTap: () {
                // Logic to change language preference
              },
            ),
            const SizedBox(height: 20),

            // Other Options Section
            _buildSectionHeader('Other Options'),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.deepPurple),
              title: const Text('FAQ'),
              onTap: () {
                // Navigate to FAQ screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_support, color: Colors.deepPurple),
              title: const Text('Contact Us'),
              onTap: () {
                // Navigate to contact form
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                // Logic to logout
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build section headers
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}

class MyTff extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final Widget? suffixIcon;

  const MyTff({
    super.key,
    required this.label,
    this.validator,
    required this.controller,
    this.obscureText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        obscureText: obscureText ?? false,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          label: Text(label, style: Theme.of(context).textTheme.bodyLarge),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}