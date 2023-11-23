class UserModel {
  String? email;
  String? role;
  String? uid;
  bool isVerified;

  UserModel({this.uid, this.email, this.role, this.isVerified = false});

  // sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'role': role,
      'isVerified': isVerified,
    };
  }

  // receiving data
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      role: map['role'],
      isVerified: map['isVerified'],
    );
  }
}
