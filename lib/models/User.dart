class User {
  final int? id;
  final String user_name;
  final String? password;
  final String? email;
  final String? birth_date;
  final String? nationality;
  final String gender;
  final String? status;
  final String type;

  User({
    required this.id,
    required this.user_name,
    this.password,
    this.email,
    this.birth_date,
    required this.nationality,
    required this.gender,
    this.status,
    required this.type,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? null,
      user_name: json['user_name'],
      password: json['password'] ?? null,
      email: json['email'] ?? null,
      birth_date: json['birth_date'] ?? null,
      nationality: json['nationality'] ?? null,
      gender: json['gender'],
      status: json['status'] ?? null,
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': user_name,
      'password': password,
      'email': email,
      'birth_date': birth_date,
      'nationality': nationality,
      'gender': gender,
      'status': status,
      'type': type,
    };
  }
}
