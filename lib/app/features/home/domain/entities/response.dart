class Response {
  final int status;
  final List<Map<String, dynamic>>? json;

  Response({required this.status, this.json});
}
