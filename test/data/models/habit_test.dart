import 'package:flutter_test/flutter_test.dart';
import 'package:habitly/data/models/habit.dart';

void main() {
  test('Habit.fromJson() harus parse data dengan benar', () {
    final json = {
      'id': 1,
      'todo': 'Morning Stretch',
      'completed': true,
      'userId': 3,
    };

    final habit = Habit.fromJson(json);

    expect(habit.id, json['id']);
    expect(habit.name, json['todo']);
    expect(habit.completed, json['completed']);
    expect(habit.userId, json['userId']);
  });

  test('Habit.copyWith() harus mengupdate data yang sesuai', () {
    final habit = Habit(
      id: 1,
      name: 'Morning Stretch',
      completed: false,
      userId: 3,
      icon: 'eco_outlined',
      frequency: 'Daily',
      colorTag: '#EB883B',
    );

    final updateHabit = habit.copyWith(completed: true);

    expect(updateHabit.id, 1);
    expect(updateHabit.name, 'Morning Stretch');
    expect(updateHabit.completed, true);
    expect(updateHabit.userId, 3);
    expect(updateHabit.icon, 'eco_outlined');
    expect(updateHabit.frequency, 'Daily');
    expect(updateHabit.colorTag, '#EB883B');
  });
}
