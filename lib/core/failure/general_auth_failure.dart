import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/strings/strings_of_error_codes.dart';

class GeneralAuthFailure extends Failure{
  const GeneralAuthFailure(
      {
    required super.errorMessage,
    super.errorCategory = StringsOfErrorCodes.generalAuthFailure
      }
      );
}