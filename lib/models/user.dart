class User {
  String email;
  String token;

  User({required this.email, required this.token});

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'] as String,
        token = json['token'] as String;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'email': email, 'password': token};
  }
}
