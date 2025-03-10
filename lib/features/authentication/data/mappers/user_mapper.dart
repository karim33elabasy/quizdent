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
      userRole: userModel.userRole,
      lastLoginDate: userModel.lastLoginDate,
      badges: userModel.badges,
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
      userRole: userEntity.userRole,
      lastLoginDate: userEntity.lastLoginDate,
      badges: userEntity.badges,
      location: userEntity.location,
      langPref: userEntity.langPref,
      accountStatus: userEntity.accountStatus,
      createdAt: userEntity.createdAt,
    );
  }
}
