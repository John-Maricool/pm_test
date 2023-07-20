import 'dart:io';

class Project {
  final String image;
  final String name;
  final String startDate;
  final String endDate;
  final List<String> tags;
  final String desc;
  final List<String> teams;

  Project(
      {required this.image,
      required this.name,
      required this.startDate,
      required this.endDate,
      required this.tags,
      required this.desc,
      required this.teams});
}
