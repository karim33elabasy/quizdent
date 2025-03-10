import 'package:equatable/equatable.dart';
import 'package:quizdent/core/constants/enums.dart';

class UserEntity extends Equatable {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
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

  const UserEntity(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture,
      required this.notificationPreferences,
      required this.userRole,
      required this.lastLoginDate,
      required this.badges,
      required this.location,
      required this.langPref,
      required this.accountStatus,
      required this.createdAt});

  UserEntity copyWith({
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? profilePicture,
    List<String>? notificationPreferences,
    String? userRole,
    DateTime? lastLoginDate,
    List<String>? badges,
    String? location,
    LangPref? langPref,
    String? accountStatus,
    DateTime? createdAt,
  }) {
    return UserEntity(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
      notificationPreferences: notificationPreferences ?? this.notificationPreferences,
      userRole: userRole ?? this.userRole,
      lastLoginDate: lastLoginDate ?? this.lastLoginDate,
      badges: badges ?? this.badges,
      location: location ?? this.location,
      langPref: langPref ?? this.langPref,
      accountStatus: accountStatus ?? this.accountStatus,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  get props => [
        userId,
        firstName,
        lastName,
        email,
        phoneNumber,
        profilePicture,
        notificationPreferences,
        userRole,
        lastLoginDate,
        badges,
        location,
        langPref,
        accountStatus,
        createdAt
      ];
}
