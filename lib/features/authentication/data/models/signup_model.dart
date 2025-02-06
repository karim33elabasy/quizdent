class SignupModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final DateTime createdAt;


  const SignupModel({required this.firstName, required this.lastName, required this.email, required this.password, required this.createdAt});

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'createdAt': createdAt.toIso8601String()
    };
  }

}