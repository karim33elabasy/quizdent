import 'package:quizdent/core/failure/failure.dart';

class RepoImplementationFailure extends Failure {
  final String errorMsg;
  final String repoType;
  const RepoImplementationFailure({required this.errorMsg, required this.repoType}):super(
      errorMessage: errorMsg,
      errorCategory: repoType
  );

}