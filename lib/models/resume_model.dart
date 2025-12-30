class ResumeData {
  final String name;
  final String title;
  final String bio;
  final String email;
  final String phone;
  final String location;
  final String linkedin;
  final String github;
  final List<Skill> skills;
  final List<Experience> experiences;
  final List<Project> projects;

  const ResumeData({
    required this.name,
    required this.title,
    required this.bio,
    required this.email,
    required this.phone,
    required this.location,
    required this.linkedin,
    required this.github,
    required this.skills,
    required this.experiences,
    required this.projects,
  });
}

class Skill {
  final String name;
  final int level;
  final String category;

  const Skill({
    required this.name,
    required this.level,
    required this.category,
  });
}

class Experience {
  final String id;
  final String company;
  final String role;
  final String period;
  final List<String> description;
  final List<String> skills;

  const Experience({
    required this.id,
    required this.company,
    required this.role,
    required this.period,
    required this.description,
    required this.skills,
  });
}

class Project {
  final String id;
  final String title;
  final String description;
  final String image;
  final List<String> tags;
  final String link;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.tags,
    required this.link,
  });
}

class ChatMessage {
  final String text;
  final bool isUser;

  const ChatMessage({
    required this.text,
    required this.isUser,
  });
}
