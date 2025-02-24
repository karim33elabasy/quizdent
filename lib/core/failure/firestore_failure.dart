import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/strings/strings_of_error_codes.dart';

class FirestoreFailure extends Failure implements Exception{
  final String? rawErrorMessage;
  FirestoreFailure({required this.rawErrorMessage}):super(
      errorMessage: rawErrorMessage?? StringsOfErrorCodes.defaultFirestoreErrorMessage .replaceAll('-', ' '),
      errorCategory: StringsOfErrorCodes.firestoreType
  );

  @override
  String toString() {
    return rawErrorMessage?? StringsOfErrorCodes.defaultFirestoreErrorMessage .replaceAll('-', ' ');
  }
}