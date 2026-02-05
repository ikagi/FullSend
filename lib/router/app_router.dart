import 'package:firebase_auth/firebase_auth.dart';
import 'package:full_send/pages/convoy_screen.dart';
import 'package:full_send/pages/garage_screen.dart';
import 'package:full_send/pages/profile_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:full_send/pages/home_screen.dart';
import 'package:full_send/pages/login_screen.dart';
import 'package:full_send/pages/register_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String garage = '/garage';
  static const String profile = '/profile';
  static const String convoy = '/convoy';
}

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: AppRoutes.login,

  redirect: (context, state) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    final isLoggingIn =
        state.matchedLocation == AppRoutes.login ||
        state.matchedLocation == AppRoutes.register;

    if (isLoggedIn && isLoggingIn) {
      return AppRoutes.home;
    }

    if (!isLoggedIn && state.matchedLocation == AppRoutes.home) {
      return AppRoutes.login;
    }

    return null;
  },

  routes: [
    GoRoute(
      path: AppRoutes.login,
      name: 'login',
      builder: (context, state) =>
          LoginScreen(onTap: () => context.go(AppRoutes.register)),
    ),
    GoRoute(
      path: AppRoutes.register,
      name: 'register',
      builder: (context, state) =>
          RegisterScreen(onTap: () => context.go(AppRoutes.login)),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.garage,
      name: 'garage',
      builder: (context, state) => const GarageScreen(),
    ),
    GoRoute(
      path: AppRoutes.profile,
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: AppRoutes.convoy,
      name: 'convoy',
      builder: (context, state) => const ConvoyScreen(),
    ),
  ],
);
