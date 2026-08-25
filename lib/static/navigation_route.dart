enum NavigationRoute {
  onBoarding("/onBoarding"),
  mainRoute("/main"),
  profileRoute("/profile"),
  loginRoute("/login"),
  registerRoute("/register"),
  statsRoute("/stats"),
  detailRoute("/detail"),
  newHabitRoute("/new"),
  splashRoute("/splash");


  const NavigationRoute(this.name);
  final String name;
}