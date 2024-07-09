class UserModel {
  String login = "";
  int? id;
  String? avatarUrl;
  String? url;

  UserModel({
    required this.login,
    this.id,
    this.avatarUrl,
    this.url,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['login'] = login;
    data['id'] = id;
    data['avatar_url'] = avatarUrl;
    data['url'] = url;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
