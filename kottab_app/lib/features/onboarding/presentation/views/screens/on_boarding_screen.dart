import 'package:flutter/material.dart';
import 'package:kottab_app/config/caching_module/secure_storage_service.dart';
import 'package:kottab_app/config/di/di.dart';
import 'package:kottab_app/core/resources/app_assets.dart';
import 'package:kottab_app/core/resources/app_colors.dart';
import 'package:kottab_app/core/routes/app_routes.dart';
import 'package:kottab_app/features/onboarding/data/models/on_boarding_model.dart';
import 'package:kottab_app/features/onboarding/presentation/views/widgets/on_boarding_page.dart';
import 'package:kottab_app/l10n/app_localizations.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage == 3) { 
      _onFinishOnBoarding();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _onFinishOnBoarding() async{
    final secureStorage = getIt<SecureStorageService>();
    await secureStorage.setOnboardingSeen(); 
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    final l10n = AppLocalizations.of(context)!;
    
    final pages = [
      OnBoardingModel(image: AppAssets.onBoardingImage1, title: l10n.learn_tajweed, description: l10n.on_boarding_desc1),
      OnBoardingModel(image: AppAssets.onBoardingImage2, title: l10n.tajweed_quran, description: l10n.on_boarding_desc2),
      OnBoardingModel(image: AppAssets.onBoardingImage3, title: l10n.placement_test_and_plan, description: l10n.on_boarding_desc3),
      OnBoardingModel(image: AppAssets.onBoardingImage4, title: l10n.challenges, description: l10n.on_boarding_desc4),
    ];

    return Stack(
      children: [
        // Background
        Image.asset(
          AppAssets.bgImage,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        
        // Top Decoration
        Positioned(
          top: 0,
          left: 0.38 * width,
          child: Image.asset(
            AppAssets.decorationImage,
            width: 0.25 * width,
            height: 0.13 * height,
          ),
        ),
        
        // Content
        SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.transparentColor,
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: pages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return OnBoardingPage(
                        model: pages[index],
                        isLastPage: index == pages.length - 1,
                        currentPage: _currentPage,
                        onNext: _onNext,
                        onFinishOnBoarding: _onFinishOnBoarding,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}