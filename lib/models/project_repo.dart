import 'package:pm_test/models/project.dart';
import 'package:pm_test/models/task.dart';

class ProjectRepo {
  static final List<Project> _projects = [];

  static setDummyProjects() {
    final projects = [
      Project(
          image: "assets/images/liberty_pay.png",
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
      Project(
          image: "assets/images/liberty_pay.png",
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
      Project(
          image: "assets/images/liberty_pay.png",
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
      Project(
          image: "assets/images/liberty_pay.png",
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

    addAllProjects(projects);
  }

  static List<Project> getProjects() {
    return _projects;
  }

  static addProject(Project project) {
    return _projects.add(project);
  }

  static addAllProjects(List<Project> project) {
    return _projects.addAll(project);
  }
}
