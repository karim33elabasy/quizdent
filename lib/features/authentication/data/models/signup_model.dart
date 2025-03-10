import 'package:quizdent/core/constants/enums.dart';
import 'package:quizdent/features/authentication/domain/utilities/signup_entity.dart';

class SignupModel extends SignupEntity {
  const SignupModel({
    required super.userId,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.password,
    required super.phoneNumber,
    required super.profilePicture,
    required super.notificationPreferences,
    required super.userRole,
    required super.lastLoginDate,
    required super.badges,
    required super.location,
    required super.langPref,
    required super.accountStatus,
    required super.createdAt,
    required super.attendedEvents,
    required super.favEvents,
  });

  /// ✅ Convert from JSON to `SignupModel`
  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      userId: json['userId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profilePicture: json['profilePicture'] as String? ?? '',
      notificationPreferences: List<String>.from(json['notificationPreferences'] ?? []),
      userRole: json['userRole'] as String? ?? 'user',
      lastLoginDate: json['lastLoginDate'] != null ? DateTime.parse(json['lastLoginDate']) : DateTime.now(),
      badges: List<String>.from(json['badges'] ?? []),
      location: json['location'] as String? ?? '',
      langPref: LangPref.values.firstWhere(
            (e) => e.toString().split('.').last == json['langPref'],
        orElse: () => LangPref.en,
      ),
      accountStatus: json['accountStatus'] as String? ?? 'active',
      createdAt: DateTime.parse(json['createdAt'] as String),
      attendedEvents: List<String>.from(json['attendedEvents'] ?? []),
      favEvents: List<String>.from(json['favEvents'] ?? [])
    );
  }

  /// ✅ Convert `SignupModel` to JSON
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'notificationPreferences': notificationPreferences,
      'userRole': userRole,
      'lastLoginDate': lastLoginDate.toIso8601String(),
      'badges': badges,
      'location': location,
      'langPref': langPref.toString().split('.').last,
      'accountStatus': accountStatus,
      'createdAt': createdAt.toIso8601String(),
      'attendedEvents': attendedEvents,
      'favEvents': favEvents,
    };
  }
}
