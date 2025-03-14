import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception{
  final String errorMessage;
  final String? errorCategory;
  const Failure({required this.errorMessage, required this.errorCategory});

  @override
  List<Object?> get props => [errorMessage];
}
