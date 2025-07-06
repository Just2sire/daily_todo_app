class TeamTask {
  final String title;
  final String description;
  final String author;
  final DateTime createdAt;
  final bool isCompleted;

  TeamTask(
      {required this.title,
      required this.description,
      required this.author,
      required this.createdAt,
      required this.isCompleted});
}
