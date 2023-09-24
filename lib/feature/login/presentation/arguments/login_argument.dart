class LoginArgument {
  final String name;
  final String email;

  LoginArgument({
    required this.name,
    required this.email
  });

  factory LoginArgument.fromFirebase(Map<String, dynamic> response) {
    return LoginArgument(
      email: response['email'],
      name: response['name'],
    );
  }
}
