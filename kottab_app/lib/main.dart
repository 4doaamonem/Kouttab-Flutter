import 'package:flutter/material.dart';
import 'package:kottab_app/config/di/di.dart';
import 'package:kottab_app/core/routes/app_routes.dart';
import 'package:kottab_app/core/routes/route_generator.dart';
import 'package:kottab_app/core/theme/app_theme.dart';
import 'package:kottab_app/l10n/app_localizations.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: RouteGenerator.getRoutes,
      initialRoute: AppRoutes.splash,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
