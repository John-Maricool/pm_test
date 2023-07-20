import 'dart:io';

class Task {
  final String name;
  final String startDate;
  final String endDate;
  final List<String> tags;
  final String desc;
  final List<String> teams;

  Task(
      {required this.name,
      required this.startDate,
      required this.endDate,
      required this.tags,
      required this.desc,
      required this.teams});
}
