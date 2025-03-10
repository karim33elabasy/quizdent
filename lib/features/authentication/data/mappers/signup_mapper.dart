import 'package:quizdent/features/authentication/data/models/signup_model.dart';
import 'package:quizdent/features/authentication/domain/utilities/signup_entity.dart';

class SignupMapper {
  /// ✅ Converts `SignupEntity` to `SignupModel`
  static SignupModel toModel({required SignupEntity signupEntity}) {
    return SignupModel(
      userId: signupEntity.userId,
      firstName: signupEntity.firstName,
      lastName: signupEntity.lastName,
      email: signupEntity.email,
      password: signupEntity.password,
      phoneNumber: signupEntity.phoneNumber,
      profilePicture: signupEntity.profilePicture,
      notificationPreferences: signupEntity.notificationPreferences,
      userRole: signupEntity.userRole,
      lastLoginDate: signupEntity.lastLoginDate,
      badges: signupEntity.badges,
      location: signupEntity.location,
      langPref: signupEntity.langPref,
      accountStatus: signupEntity.accountStatus,
      createdAt: signupEntity.createdAt,
      favEvents: signupEntity.favEvents,
      attendedEvents: signupEntity.attendedEvents,
    );
  }

  /// ✅ Converts `SignupModel` to `SignupEntity`
  static SignupEntity toEntity({required SignupModel signupModel}) {
    return SignupEntity(
      userId: signupModel.userId,
      firstName: signupModel.firstName,
      lastName: signupModel.lastName,
      email: signupModel.email,
      password: signupModel.password,
      phoneNumber: signupModel.phoneNumber,
      profilePicture: signupModel.profilePicture,
      notificationPreferences: signupModel.notificationPreferences,
      userRole: signupModel.userRole,
      lastLoginDate: signupModel.lastLoginDate,
      badges: signupModel.badges,
      location: signupModel.location,
      langPref: signupModel.langPref,
      accountStatus: signupModel.accountStatus,
      createdAt: signupModel.createdAt,
      attendedEvents: signupModel.attendedEvents,
      favEvents: signupModel.favEvents,
    );
  }
}
