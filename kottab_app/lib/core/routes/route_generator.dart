import 'package:flutter/material.dart';
import 'package:kottab_app/core/routes/app_routes.dart';
import 'package:kottab_app/features/splash/presentation/views/screens/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings){
    switch(settings.name){
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen(),);
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}