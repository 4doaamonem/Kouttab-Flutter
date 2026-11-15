import 'package:flutter/material.dart';
import 'package:kottab_app/config/caching_module/secure_storage_service.dart';
import 'package:kottab_app/config/di/di.dart';
import 'package:kottab_app/core/resources/app_assets.dart';
import 'package:kottab_app/core/resources/app_colors.dart';
import 'package:kottab_app/core/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const new({super.key});
  final String onboarding = AppRoutes.onBoarding;
	final String home = AppRoutes.home;
	final String login = AppRoutes.login;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _resolveNextScreen() async {
		await Future<void>.delayed(const Duration(seconds: 3));
    final secureStorage = getIt<SecureStorageService>();
    final isFirstTime = await secureStorage.isFirstTime();
    final token = await secureStorage.getToken();
    final isLoggedIn = token != null && token.isNotEmpty;
		String destination;
		if (isFirstTime) {
			destination = widget.onboarding;
		} else if (isLoggedIn) {
			destination = widget.home;
		} else {
			destination = widget.login;
		}

		if (!mounted) return;
		Navigator.of(context).pushReplacementNamed(destination);
	}
  @override
  void initState() {
    super.initState();
    _resolveNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        Image.asset(AppAssets.bgImage,width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
        SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.transparentColor,
            body: Stack(
              alignment: Alignment.center,
              children: [
                Center(child: Image.asset(AppAssets.kouttabLogo,width: 0.54*width,height: 0.28*height,)),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(AppAssets.decorationImage,width: 0.55*width,height: 0.28*height,)
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}