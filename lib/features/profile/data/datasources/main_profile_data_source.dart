import 'package:quizdent/features/authentication/data/models/user_model.dart';

abstract class MainProfileDataSource {
  Future<void> updateUserProfile({required UserModel userModel});
}