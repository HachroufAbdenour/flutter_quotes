import 'package:counter_getx/models/Category.dart';
import 'package:counter_getx/models/Theme.dart';

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
    this.nationality,
    required this.gender,
    this.status,
    required this.type,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    print("id" +
        json['id'].toString() +
        "user_name" +
        json['user_name'].toString() +
        "password" +
        json['password'].toString() +
        "email" +
        json['email'].toString() +
        "birth_date" +
        json['birth_date'].toString() +
        "nationality" +
        json['nationality'].toString() +
        "gender" +
        json['gender'].toString() +
        "status" +
        json['status'].toString() +
        "type" +
        json['type'].toString());

    return User(
      id: json['id'],
      user_name: json['user_name'],
      password: json['password'],
      email: json['email'],
      birth_date: json['birth_date'],
      nationality: json['nationality'],
      gender: json['gender'],
      status: json['status'],
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

class UserItem {
  late User user;
  late CategoryItem? category;
  late Theme? theme;

  UserItem({
    required this.user,
    required this.category,
    required this.theme,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) {
    return UserItem(
      user: User.fromJson(json),
      category: CategoryItem.fromJson(json['category']),
      theme: Theme.fromJson(json['theme']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'category': category!.toJson(),
      'theme': theme!.toJson(),
    };
  }
}
