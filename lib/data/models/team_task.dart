class TeamTask {
  final String title;
  final String description;
  final String author;
  final DateTime created_at;
  final bool isCompleted;

  TeamTask(
      {required this.title,
      required this.description,
      required this.author,
      required this.created_at,
      required this.isCompleted}
      );
}

