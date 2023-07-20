import 'package:pm_test/models/task.dart';

class TaskRepo {
  static final List<Task> _tasks = [];

  static setDummyTasks() {
    final tasks = [
      Task(
          name: "Liberty Pay",
          startDate: "22-2-2000",
          endDate: "22-02-2020",
          tags: ["Design", "Backend"],
          desc: "Not too good with design but good with frontend",
          teams: [
            "assets/images/test_img1.png",
            "assets/images/test_img2.png",
            "assets/images/test_img3.png"
          ]),
      Task(
          name: "Liberty Pay",
          startDate: "22-2-2000",
          endDate: "22-02-2020",
          tags: ["Machine Learning", "FrontEnd"],
          desc: "Not too good with design but good with frontend",
          teams: [
            "assets/images/test_img1.png",
            "assets/images/test_img2.png",
            "assets/images/test_img3.png"
          ]),
      Task(
          name: "Liberty Pay",
          startDate: "22-2-2000",
          endDate: "22-02-2020",
          tags: ["Design", "Data Science"],
          desc: "Not too good with design but good with frontend",
          teams: [
            "assets/images/test_img1.png",
            "assets/images/test_img2.png",
            "assets/images/test_img3.png"
          ]),
      Task(
          name: "Liberty Pay",
          startDate: "22-2-2000",
          endDate: "22-02-2020",
          tags: ["Design", "FrontEnd"],
          desc: "Not too good with design but good with frontend",
          teams: [
            "assets/images/test_img1.png",
            "assets/images/test_img2.png",
            "assets/images/test_img3.png"
          ])
    ];

    addAllTasks(tasks);
  }

  static List<Task> getTasks() {
    return _tasks;
  }

  static addTask(Task task) {
    return _tasks.add(task);
  }

  static addAllTasks(List<Task> task) {
    return _tasks.addAll(task);
  }
}
