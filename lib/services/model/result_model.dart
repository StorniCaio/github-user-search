class Result {
  bool status;
  late int? code;
  late Map<String, dynamic> body;
  Result({
    required this.status,
    this.code,
    this.body = const {},
  });
}
