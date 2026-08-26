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
}

final habitsProvider = AsyncNotifierProvider<HabitsNotifier, List<Habit>>(() {
  return HabitsNotifier();
});
