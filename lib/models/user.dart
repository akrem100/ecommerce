class User {
  String username;
  String password;
  String? lastName;
  String? firstName;
  String? phone;
  String? adresse;
  String? email;
  List<String>? roles;
  User(
      {required this.username,
      required this.password,
      this.lastName,
      this.firstName,
      this.phone,
      this.adresse,
      this.email,
      this.roles});
}
