import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/features/authentication/domain/usecases/forget_password_usecase.dart';
import 'package:quizdent/features/authentication/domain/usecases/login_usecase.dart';
import 'package:quizdent/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_event.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUseCase;
  final SignupUsecase signupUseCase;
  final ForgetPasswordUsecase forgotPasswordUseCase;

  AuthBloc({required this.loginUseCase, required this.signupUseCase, required this.forgotPasswordUseCase}): super(InitialAuthState()){
    on<LoginAuthEvent>(_login);
    on<SignupAuthEvent>(_signup);
    on<ForgetPasswordAuthEvent>(_forgetPassword);
    on<UpdateUserEntity>(_updateUserEntity);
  }

  UserEntity? user;

  _login(LoginAuthEvent event, Emitter<AuthState> emit) async{
    emit(LoadingAuthState());
    var result = await loginUseCase.call(params: event.loginEntity);
    result.fold(
        (error){emit(FailureAuthState(errorMessage: error.errorMessage));},
        (userEntity){
          user = userEntity;
          emit(LoggedInAuthState(userEntity: userEntity));
        }
    );
  }

  _signup(SignupAuthEvent event, Emitter<AuthState> emit) async{
    emit(LoadingAuthState());
    var result = await signupUseCase.call(params: event.signupEntity);
    result.fold(
        (error){emit(FailureAuthState(errorMessage: error.errorMessage));},
        (success){emit(SignedUpAuthState());}
    );
  }

  _forgetPassword(ForgetPasswordAuthEvent event, Emitter<AuthState> emit) async{
    emit(LoadingForgetPasswordAuthState());
    var result = await forgotPasswordUseCase.call(params: event.email);
    result.fold(
            (error){emit(FailureAuthState(errorMessage: error.errorMessage));},
            (success){emit(ChangedPasswordAuthState());}
    );
  }

  _updateUserEntity(UpdateUserEntity event , Emitter emit){
    user = event.userEntity;
    emit(LoggedInAuthState(userEntity: event.userEntity));
  }
}