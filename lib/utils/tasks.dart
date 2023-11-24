import 'dart:math';

List<Map> allPersonalTasks = [
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': false,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': false,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': false,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': false,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': false,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
  ];


List<Map> allTeamTasks = [
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': false,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': false,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': false,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': false,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': false,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
  ];

const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';

///Generate string containing characters and numbers randomly
String generateRandomString(int length) {
  final random = Random();
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(
        random.nextInt(chars.length),
      ),
    ),
  );
}

/// Generate random number
String generateRandomNumber(int length) {
  final random = Random();
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => random.nextInt(10),
    ),
  );
}

String generateFireStoreID() {
  return generateRandomString(20);
}