import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:full_send/pages/home_screen.dart';
import 'package:full_send/pages/login_screen.dart';
import 'package:full_send/pages/register_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
}

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: AppRoutes.login, // Zaczynamy od logowania
  
  redirect: (context, state) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    final isLoggingIn = state.matchedLocation == AppRoutes.login ||
        state.matchedLocation == AppRoutes.register;

    // Jeśli użytkownik jest zalogowany, ale próbuje wejść na login/register
    if (isLoggedIn && isLoggingIn) {
      return AppRoutes.home;
    }

    // Jeśli użytkownik NIE jest zalogowany, ale próbuje wejść na home
    if (!isLoggedIn && state.matchedLocation == AppRoutes.home) {
      return AppRoutes.login;
    }

    return null; // Nie rób żadnego przekierowania
  },

  routes: [
    GoRoute(
      path: AppRoutes.login,
      name: 'login',
      builder: (context, state) => LoginScreen(
        onTap: () => context.go(AppRoutes.register),
      ),
    ),
    GoRoute(
      path: AppRoutes.register,
      name: 'register',
      builder: (context, state) => RegisterScreen(
        onTap: () => context.go(AppRoutes.login),
      ),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);