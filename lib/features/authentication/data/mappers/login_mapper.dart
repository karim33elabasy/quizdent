import 'package:quizdent/features/authentication/data/models/login_model.dart';
import 'package:quizdent/features/authentication/domain/utilities/login_entity.dart';

class LoginMapper {
  static LoginEntity toEntity({required LoginModel loginModel}) {
    return LoginEntity(
      email: loginModel.email,
      password: loginModel.password
    );
  }

  static LoginModel toModel({required LoginEntity loginEntity}){
    return LoginModel(
      email: loginEntity.email,
      password: loginEntity.password
    );
  }
}