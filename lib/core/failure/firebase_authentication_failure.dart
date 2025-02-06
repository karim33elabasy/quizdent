import 'package:quizdent/core/failure/failure.dart';

class FirebaseAuthenticationFailure extends Failure {
  final String rawErrorMessage;
  FirebaseAuthenticationFailure({required this.rawErrorMessage}):super(
      errorMessage: rawErrorMessage.replaceAll('-', ' '),
      errorCategory: "FirebaseAuthentication Failure"
  );
}