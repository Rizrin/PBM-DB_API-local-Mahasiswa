class User {
  String? id;
  String? username;
  String? password;
  User({this.id, this.username, this.password});
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        username: json['username'],
        password: json['password'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'password': password,
      };
}
