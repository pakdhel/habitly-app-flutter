import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitly/data/models/habit.dart';
import 'package:habitly/data/providers/providers.dart';
import 'package:habitly/data/providers/user_provider.dart';

class HabitsNotifier extends AsyncNotifier<List<Habit>> {
  @override
  Future<List<Habit>> build() async {
    // TODO: implement build
    final user = ref.watch(userProvider);
    if (user == null) return [];
    final habitServices = ref.read(habitServicesProvider);
    final habits = await habitServices.getHabitByUserId(user.id);
    return habits;
  }

  void toggleHabitLocally(int id, bool completed) async {
    final currentHabits = state.value;
    if (currentHabits == null) return;
    
    final updatedHabits = currentHabits
        .map(
          (habit) =>
              habit.id == id ? habit.copyWith(completed: completed) : habit,
        )
        .toList();

    state = AsyncValue.data(updatedHabits);
  }
}

final habitsProvider = AsyncNotifierProvider<HabitsNotifier, List<Habit>>(() {
  return HabitsNotifier();
});
