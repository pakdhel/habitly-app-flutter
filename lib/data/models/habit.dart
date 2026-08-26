class Habit {
  final int id;
  final String name;
  final bool completed;
  final int userId;

  Habit({
    required this.id,
    required this.name,
    required this.completed,
    required this.userId,
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
}
