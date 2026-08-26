import 'package:habitly/data/models/habit.dart';

class HabitListResponse {
  final int total;
  final int skip;
  final int limit;
  final List<Habit> habits;

  HabitListResponse({
    required this.total,
    required this.skip,
    required this.limit,
    required this.habits,
  });

  factory HabitListResponse.fromJson(Map<String, dynamic> json) {
    return HabitListResponse(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
      habits: (json['todos'] as List)
          .map((habit) => Habit.fromJson(habit as Map<String, dynamic>))
          .toList(),
    );
  }
}
