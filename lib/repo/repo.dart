import 'package:profile_app/model/profile.dart';

class RepoData {
  static final Profile projects = Profile(
      name: "Kristopher Andrews",
      location: "Fort Myers Area",
      logo: "assets/logo.png",
      backdropPhoto: "assets/creator.png",
      about:
          "Software developer with a particular interest in cross-platform mobile development using the Dart programming language and the Flutter framework."
          "I am also strong advocate for disability rights and accessibility within the software industry.",
      projects: <Project>[
        Project(
            title: "bmi_app",
            thumbnail: "assets/bmi_app.png",
            url: "https://github.com/KristopherCA/bmi_app"),
        Project(
            title: "notodo_app",
            thumbnail: "assets/notodo_app.png",
            url: "https://github.com/KristopherCA/notodo_app")
      ]);
}
