class PersonalTask {
  final String id;
  final String title;
  final String description;
  final String? author;
  final DateTime createdAt = DateTime.now();
  final bool isCompleted;

  PersonalTask({
    this.author,
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'author': "Me",
      'created_at': createdAt.toIso8601String(),
      'is_completed': isCompleted,
    };
  }

  PersonalTask copyWith({
    String? author,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return PersonalTask(
      id: id,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
