enum NavigationRoute {
  homeRoute("/"),
  profileRoute("/profile"),
  loginRoute("/login"),
  registerRoute("/register"),
  statsRoute("/stats"),
  detailRoute("/detail"),
  newHabitRoute("/new");

  const NavigationRoute(this.name);
  final String name;
}