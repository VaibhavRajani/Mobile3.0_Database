class Project {
  final int? id;
  final String title;
  final String description;

  const Project({required this.title, required this.description, this.id});

  factory Project.fromJson(Map<String, dynamic> json) => Project(
      id: json['id'], title: json['title'], description: json['description']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'description': description};
}
