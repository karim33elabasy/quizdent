import 'package:quizdent/core/failure/failure.dart';

class FirestoreFailure extends Failure {
  final String rawErrorMessage;
  FirestoreFailure({required this.rawErrorMessage}):super(
      errorMessage: rawErrorMessage.replaceAll('-', ' '),
      errorCategory: "Firestore Failure"
  );
}