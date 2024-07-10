class UserFilterModel {
  String? location;
  String? language;
  int? followers;
  int? repos;

  UserFilterModel({
    this.location,
    this.language,
    this.repos,
    this.followers,
  });

  UserFilterModel.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    language = json['language'];
    followers = json['followers'];
    repos = json['repos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['location'] = location;
    data['language'] = language;
    data['followers'] = followers;
    data['repos'] = repos;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }

  bool hasFilter() {
    return location != null ||
        language != null ||
        repos != null ||
        followers != null;
  }
}
