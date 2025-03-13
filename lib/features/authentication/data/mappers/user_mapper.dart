import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';
import 'package:quizdent/features/authentication/data/models/user_model.dart';

class UserMapper {
  static UserEntity toEntity({required UserModel userModel}) {
    return UserEntity(
      userId: userModel.userId,
      firstName: userModel.firstName,
      lastName: userModel.lastName,
      email: userModel.email,
      phoneNumber: userModel.phoneNumber,
      profilePicture: userModel.profilePicture,
      notificationPreferences: userModel.notificationPreferences,
      badges: userModel.badges,
      attendedEvents: userModel.attendedEvents,
      favEvents: userModel.favEvents,
      userRole: userModel.userRole,
      lastLoginDate: userModel.lastLoginDate,
      location: userModel.location,
      langPref: userModel.langPref,
      accountStatus: userModel.accountStatus,
      createdAt: userModel.createdAt,
    );
  }

  static UserModel toModel({required UserEntity userEntity}) {
    return UserModel(
      userId: userEntity.userId,
      firstName: userEntity.firstName,
      lastName: userEntity.lastName,
      email: userEntity.email,
      phoneNumber: userEntity.phoneNumber,
      profilePicture: userEntity.profilePicture,
      notificationPreferences: userEntity.notificationPreferences,
      badges: userEntity.badges,
      attendedEvents: userEntity.attendedEvents,
      favEvents: userEntity.favEvents,
      userRole: userEntity.userRole,
      lastLoginDate: userEntity.lastLoginDate,
      location: userEntity.location,
      langPref: userEntity.langPref,
      accountStatus: userEntity.accountStatus,
      createdAt: userEntity.createdAt,
    );
  }
}
