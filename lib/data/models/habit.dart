class Habit {
  final int id;
  final String name;
  final bool completed;
  final int userId;
  String? icon;
  String? frequency;
  String? colorTag;

  Habit({
    required this.id,
    required this.name,
    required this.completed,
    required this.userId,
    this.icon,
    this.frequency,
    this.colorTag,
  });

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id'],
      name: json['todo'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'todo': name, 'completed': completed, 'userId': userId};
  }

  Habit copyWith({
    bool? completed,
    String? icon,
    String? frequency,
    String? colorTag,
  }) {
    return Habit(
      id: id,
      name: name,
      completed: completed ?? this.completed,
      userId: userId,
      icon: icon ?? this.icon,
      frequency: frequency ?? this.frequency,
      colorTag: colorTag ?? this.colorTag,
    );
  }
}
