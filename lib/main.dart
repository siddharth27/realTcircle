import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/config/supabase_config.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Supabase
    await Supabase.initialize(
      url: SupabaseConfig.url,
      anonKey: SupabaseConfig.anonKey,
    );
  } catch (e) {
    // Log error but continue - app can still show UI
    debugPrint('Failed to initialize Supabase: $e');
    debugPrint('URL: ${SupabaseConfig.url}');
    debugPrint('Key: ${SupabaseConfig.anonKey.substring(0, 20)}...');
  }

  runApp(const RealTCircleApp());
}

class RealTCircleApp extends StatelessWidget {
  const RealTCircleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RealTCircle',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
