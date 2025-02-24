import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/strings/strings_of_error_codes.dart';

class FirebaseAuthenticationFailure extends Failure implements Exception{
  final String? rawErrorMessage;
  FirebaseAuthenticationFailure({required this.rawErrorMessage}):super(
      errorMessage: rawErrorMessage?? StringsOfErrorCodes.defaultFirebaseAuthErrorMessage .replaceAll('-', ' '),
      errorCategory: StringsOfErrorCodes.firebaseAuthType
  );

  @override
  String toString() {
    return rawErrorMessage?? StringsOfErrorCodes.defaultFirebaseAuthErrorMessage .replaceAll('-', ' ');
  }
}