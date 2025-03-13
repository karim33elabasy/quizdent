import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizdent/core/variables_and_enums/enums.dart';
import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.userId,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phoneNumber,
    required super.profilePicture,
    required super.notificationPreferences,
    required super.badges,
    required super.attendedEvents,
    required super.favEvents,
    required super.userRole,
    required super.lastLoginDate,
    required super.location,
    required super.langPref,
    required super.accountStatus,
    required super.createdAt,
  });

  factory UserModel.fromJson({required Map<String, dynamic> json, required String id}) {
    return UserModel(
      userId: id,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profilePicture: json['profilePicture'] as String,
      notificationPreferences: List<String>.from(json['notificationPreferences'] ?? <String>[]),
      badges: List<String>.from(json['badges'] ?? <String>[]),
      attendedEvents: List<String>.from(json['attendedEvents'] ?? <String>[]),
      favEvents: List<String>.from(json['favEvents'] ?? <String>[]),
      userRole: json['userRole'] as String,
      lastLoginDate: DateTime.parse(json['lastLoginDate'] as String),
      location: json['location'] as String,
      langPref: LangPref.values.firstWhere(
            (e) => e.toString().split('.').last == json['langPref'],
        orElse: () => LangPref.en,
      ),
      accountStatus: json['accountStatus'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'notificationPreferences': notificationPreferences,
      'badges': badges,
      'attendedEvents': attendedEvents,
      'favEvents': favEvents,
      'userRole': userRole,
      'lastLoginDate': lastLoginDate.toIso8601String(),
      'location': location,
      'langPref': langPref.toString().split('.').last,
      'accountStatus': accountStatus,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory UserModel.fake() {
    return UserModel(
      userId: FirebaseAuth.instance.currentUser?.uid ?? 'fakeUserId123',
      firstName: 'John',
      lastName: 'Doe',
      email: 'johndoe@example.com',
      phoneNumber: '+1234567890',
      profilePicture: 'https://example.com/profile.jpg',
      notificationPreferences: const ['Event Reminders', 'Promotional Offers', 'New Features'],
      badges: const ['Early Bird', 'Frequent Attendee'],
      attendedEvents: const ['Event A', 'Event B'],
      favEvents: const ['Event C', 'Event D'],
      userRole: 'User',
      lastLoginDate: DateTime.now(),
      location: 'New York, USA',
      langPref: LangPref.en,
      accountStatus: 'Active',
      createdAt: DateTime.now().subtract(const Duration(days: 100)),
    );
  }
}
