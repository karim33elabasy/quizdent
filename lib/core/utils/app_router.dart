import 'package:go_router/go_router.dart';
import 'package:quizdent/features/authentication/presentation/auth_screen.dart';
import 'package:quizdent/features/home/presentation/home_screen.dart';

abstract class AppRouter {
  static const String kHomeScreen = "/kHomeScreen";
  static final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const AuthScreen(),
        ),
        GoRoute(
          path: kHomeScreen,
          builder: (context, state) => const HomeScreen(),
        ),
      ]
  );
}