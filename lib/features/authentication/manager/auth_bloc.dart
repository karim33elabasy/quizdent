import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/features/authentication/data/repo/auth_repo.dart';
import 'package:quizdent/features/authentication/manager/auth_event.dart';
import 'package:quizdent/features/authentication/manager/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo): super(InitialAuthState()){
    on<LoginAuthEvent>(_login);
    on<SignupAuthEvent>(_signup);
    on<ForgetPasswordAuthEvent>(_forgetPassword);
  }

  _login(LoginAuthEvent event, Emitter<AuthState> emit) async{
    emit(LoadingAuthState());
    var result = await _authRepo.login(loginModel: event.loginModel);
    result.fold(
        (error){emit(FailureAuthState(errorMessage: error.errorMessage));},
        (success){emit(LoggedInAuthState());}
    );
  }

  _signup(SignupAuthEvent event, Emitter<AuthState> emit) async{
    emit(LoadingAuthState());
    var result = await _authRepo.signup(signupUser: event.signupModel);
    result.fold(
        (error){emit(FailureAuthState(errorMessage: error.errorMessage));},
        (success){emit(SignedUpAuthState());}
    );
  }

  _forgetPassword(ForgetPasswordAuthEvent event, Emitter<AuthState> emit) async{
    emit(LoadingForgetPasswordAuthState());
    var result = await _authRepo.forgetPassword(email: event.email);
    result.fold(
            (error){emit(FailureAuthState(errorMessage: error.errorMessage));},
            (success){emit(ChangedPasswordAuthState());}
    );
  }
}