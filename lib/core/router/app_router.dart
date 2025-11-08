import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/properties/presentation/screens/property_list_screen.dart';
import '../../features/properties/presentation/screens/property_detail_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../config/supabase_config.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final isAuthenticated = SupabaseConfig.isAuthenticated;
      final isOnSplash = state.matchedLocation == '/splash';
      final isOnAuth = state.matchedLocation.startsWith('/auth');

      // Let splash screen handle initial routing
      if (isOnSplash) return null;

      // Redirect to login if not authenticated and not on auth screens
      if (!isAuthenticated && !isOnAuth) {
        return '/auth/login';
      }

      // Redirect to home if authenticated and on auth screens
      if (isAuthenticated && isOnAuth) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/auth/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/auth/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/properties',
        builder: (context, state) => const PropertyListScreen(),
      ),
      GoRoute(
        path: '/properties/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return PropertyDetailScreen(propertyId: id);
        },
      ),
    ],
  );
}
