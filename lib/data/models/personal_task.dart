class PersonalTask {
  final String id;
  final String title;
  final String description;
  final String author;
  late DateTime createdAt = DateTime.now();
  final bool isCompleted;

  PersonalTask({
    this.author = "Desiré",
    required this.id,
    required this.title,
    required this.description,
    DateTime? createdAt,
    this.isCompleted = false,
  }) {
    this.createdAt = createdAt ?? DateTime.now();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'author': "Me",
      'createdAt': createdAt.toIso8601String(),
      'is_completed': isCompleted,
    };
  }

  factory PersonalTask.fromMap(Map<String, dynamic> map) {
    return PersonalTask(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      author: map['author'],
      isCompleted: map['is_completed'],
      createdAt: DateTime.tryParse(map['createdAt']),
    );
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
