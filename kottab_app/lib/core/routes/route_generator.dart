import 'package:flutter/material.dart';
import 'package:kottab_app/core/routes/app_routes.dart';
import 'package:kottab_app/features/auth/login/presentation/views/screens/login_screen.dart';
import 'package:kottab_app/features/home/presentation/views/screens/home_screen.dart';
import 'package:kottab_app/features/onboarding/presentation/views/screens/on_boarding_screen.dart';
import 'package:kottab_app/features/splash/presentation/views/screens/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings){
    switch(settings.name){
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen(),);
      case AppRoutes.onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingScreen(),); 
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen(),); 
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen(),);  
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