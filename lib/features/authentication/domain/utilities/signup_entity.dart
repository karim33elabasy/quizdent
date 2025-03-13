import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';

class SignupEntity extends UserEntity {
  final String password;

  const SignupEntity({
    super.userId = 'none',
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phoneNumber,
    required this.password,
    super.profilePicture = 'random',
    super.notificationPreferences = const [],
    super.badges = const [],
    super.attendedEvents = const [],
    super.favEvents = const [],
    required super.userRole,
    required super.lastLoginDate,
    super.location = 'none',
    required super.langPref,
    super.accountStatus = 'active',
    required super.createdAt,
  });
}