abstract class SupportStates{}

class SupportStateInitial extends SupportStates{}

class SupportStateSuccess extends SupportStates{}

class SupportStateLoading extends SupportStates{}

class SupportStateFailure extends SupportStates{
  final String message;
  SupportStateFailure({required this.message});
}