import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase configuration
///
/// For production, use environment variables or secure storage
/// IMPORTANT: Replace these with your actual Supabase credentials
class SupabaseConfig {
  static const String url = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'YOUR_SUPABASE_URL_HERE',
  );

  static const String anonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'YOUR_SUPABASE_ANON_KEY_HERE',
  );

  // Supabase client instance
  static SupabaseClient get client => Supabase.instance.client;

  // Auth helpers
  static User? get currentUser => client.auth.currentUser;
  static bool get isAuthenticated => currentUser != null;
}
