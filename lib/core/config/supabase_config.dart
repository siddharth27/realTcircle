import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase configuration
///
/// Uses compile-time environment variables for secure credential management
/// Credentials can be passed during build using --dart-define flags
class SupabaseConfig {
  static const String url = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://spwsglhjwpbpoawqhsqj.supabase.co',
  );

  static const String anonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNwd3NnbGhqd3BicG9hd3Foc3FqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI1MTA0MjUsImV4cCI6MjA3ODA4NjQyNX0.oMxnt_s0n7KqpGaZQhRcFuWkvli3TZySyrd0o-okZK4',
  );

  // Supabase client instance
  static SupabaseClient get client => Supabase.instance.client;

  // Auth helpers
  static User? get currentUser => client.auth.currentUser;
  static bool get isAuthenticated => currentUser != null;
}
