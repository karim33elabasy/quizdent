import 'package:equatable/equatable.dart';
import 'package:quizdent/core/variables_and_enums/enums.dart';

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

  const UserEntity({
    required this.userId,
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
    required this.createdAt,
  });

  // Convert UserEntity to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'notificationPreferences': notificationPreferences,
      'userRole': userRole,
      'lastLoginDate': lastLoginDate.toIso8601String(),
      'badges': badges,
      'location': location,
      'langPref': langPref.toString().split('.').last, // Convert enum to string
      'accountStatus': accountStatus,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create a UserEntity from a JSON map
  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      userId: json['userId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profilePicture: json['profilePicture'] as String,
      notificationPreferences: List<String>.from(json['notificationPreferences'] ?? <String>[]),
      userRole: json['userRole'] as String,
      lastLoginDate: DateTime.parse(json['lastLoginDate'] as String),
      badges: List<String>.from(json['badges'] ?? <String>[]),
      location: json['location'] as String,
      langPref: LangPref.values.firstWhere(
            (e) => e.toString().split('.').last == json['langPref'],
        orElse: () => LangPref.en, // Default to LangPref.en if not found
      ),
      accountStatus: json['accountStatus'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

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
  List<Object?> get props => [
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
    createdAt,
  ];
}