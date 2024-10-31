// ignore_for_file: file_names
class User {
  final String name;
  final String email;
  final String password;
  final String role; // Tambahkan properti role

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.role, // Tambahkan role ke dalam konstruktor
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'role': role, // Sertakan role dalam representasi JSON
    };
  }
}