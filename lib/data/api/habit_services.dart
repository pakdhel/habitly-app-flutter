import 'package:dio/dio.dart';
import 'package:habitly/data/models/habit.dart';
import 'package:habitly/data/models/habit_list_response.dart';

class HabitServices {
  final Dio dio;
  HabitServices({required this.dio});

  Future<List<Habit>> getHabitByUserId(int userId) async {    
    final response = await dio.get('/todos/user/$userId');
    final habitsListResponse = HabitListResponse.fromJson(response.data);
    return habitsListResponse.habits;
  }

  Future<Habit> addHabit(String name, int userId) async {
    final response = await dio.post(
      '/todos/add',
      data: {'todo': name, 'completed': false, 'userId': userId},
    );

    return Habit.fromJson(response.data);
  }

  Future<Habit> updateHabit(bool isComplete, int id) async {
    final response = await dio.put(
      '/todos/$id',
      data: {'completed': isComplete},
    );

    return Habit.fromJson(response.data);
  }

  Future<void> deleteHabit(int id) async {
    await dio.delete('/todos/$id');
  }
}
