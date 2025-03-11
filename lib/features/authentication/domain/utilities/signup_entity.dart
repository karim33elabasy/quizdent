import 'package:quizdent/core/variables_and_enums/enums.dart';

class SignupEntity {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final String profilePicture;
  final List<String> notificationPreferences;
  final String userRole;
  final DateTime lastLoginDate;
  final List<String> badges;
  final String location;
  final LangPref langPref;
  final String accountStatus;
  final DateTime createdAt;
  final List attendedEvents;
  final List favEvents;

  const SignupEntity({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.profilePicture,
    required this.notificationPreferences,
    required this.userRole,
    required this.lastLoginDate,
    required this.badges,
    required this.location,
    required this.langPref,
    required this.accountStatus,
    required this.createdAt,
    required this.attendedEvents,
    required this.favEvents
  });
}
