import 'package:quizdent/features/authentication/data/models/signup_model.dart';
import 'package:quizdent/features/authentication/domain/utilities/signup_entity.dart';

class SignupMapper {

  static SignupModel toModel({required SignupEntity signupEntity}) {
    return SignupModel(
        firstName: signupEntity.firstName,
        lastName: signupEntity.lastName,
        email: signupEntity.email,
        password: signupEntity.password,
        createdAt: signupEntity.createdAt
    );
  }

  static SignupEntity toEntity({required SignupModel signupModel}) {
    return SignupEntity(
        firstName: signupModel.firstName,
        lastName: signupModel.lastName,
        email: signupModel.email,
        password: signupModel.password,
        createdAt: signupModel.createdAt
    );
  }
}