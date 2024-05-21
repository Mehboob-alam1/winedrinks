import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String userName;
  String email;
  String password;
  String profilePicture;

  UserModel(
      {required this.id,
      required this.name,
      required this.userName,
      required this.email,
      required this.password,
      required this.profilePicture});

  /// static function to create an empty user model
  static UserModel empty() => UserModel(
      id: '',
      name: '',
      userName: '',
      email: '',
      password: '',
      profilePicture: '');

  /// Convert Model to Json Structure for storing data in firebase

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'UserName': userName,
      'Email': email,
      'Password': password,
      'ProfilePicture': profilePicture
    };
  }

  /// Factory method to create a user model from a firebase document snapshot

  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();

      return UserModel(
        id: document.id,
        name: data?['Name'] ?? '',
        userName: data?['UserName'] ?? '',
        email: data?['Email'] ?? '',
        password: data?['Password'] ?? '',
        profilePicture: '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
