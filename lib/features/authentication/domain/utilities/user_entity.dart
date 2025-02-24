import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String email;

  const UserEntity({required this.firstName, required this.lastName, required this.email});

  @override
  get props => [firstName, lastName, email];
}