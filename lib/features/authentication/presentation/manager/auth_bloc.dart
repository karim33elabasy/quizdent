import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/features/authentication/domain/usecases/forget_password_usecase.dart';
import 'package:quizdent/features/authentication/domain/usecases/login_usecase.dart';
import 'package:quizdent/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_event.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUseCase;
  final SignupUsecase signupUseCase;
  final ForgetPasswordUsecase forgotPasswordUseCase;
  AuthBloc({required this.loginUseCase, required this.signupUseCase, required this.forgotPasswordUseCase}): super(InitialAuthState()){
    on<LoginAuthEvent>(_login);
    on<SignupAuthEvent>(_signup);
    on<ForgetPasswordAuthEvent>(_forgetPassword);
  }

  _login(LoginAuthEvent event, Emitter<AuthState> emit) async{
    emit(LoadingAuthState());
    var result = await loginUseCase.call(params: event.loginEntity);
    result.fold(
        (error){emit(FailureAuthState(errorMessage: error.errorMessage));},
        (success){emit(LoggedInAuthState());}
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
    emit(LoadingAuthState());
    var result = await forgotPasswordUseCase.call(params: event.email);
    result.fold(
            (error){emit(FailureAuthState(errorMessage: error.errorMessage));},
            (success){emit(ChangedPasswordAuthState());}
    );
  }
}