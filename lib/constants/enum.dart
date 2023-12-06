enum StudentMenuAction { logout, search }

enum TeacherMenuAction { logout, deleteAccount }

enum MessageType {
  text,
  image;

  String toJson() => name;

  factory MessageType.fromJson(String json) => values.byName(json);
}
