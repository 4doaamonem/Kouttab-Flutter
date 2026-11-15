import 'package:flutter/material.dart';
import 'package:kottab_app/core/resources/app_colors.dart';
import 'package:kottab_app/features/onboarding/data/models/on_boarding_model.dart';
import 'package:kottab_app/l10n/app_localizations.dart';

class OnBoardingPage extends StatelessWidget {
  final OnBoardingModel model;
  final bool isLastPage;
  final VoidCallback onNext;
  final VoidCallback onFinishOnBoarding;
  final int currentPage;

  const OnBoardingPage({
    super.key,
    required this.model,
    required this.isLastPage,
    required this.onNext,
    required this.onFinishOnBoarding,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    final l10n = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            // Force minimum height to screen size
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Stack(
                children: [
                  // 1. Main Centralized Content
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.06 * width,
                        vertical: 0.02 * height,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image
                          Image.asset(
                            model.image,
                            width: 0.75 * width,
                            fit: BoxFit.contain,
                          ),
                          
                          SizedBox(height: 0.03 * height),

                          // Bubbles
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              4, 
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                height: 4,
                                width: currentPage == index ? 20 : 8,
                                decoration: BoxDecoration(
                                  color: currentPage == index
                                      ? AppColors.darkGreenColor
                                      : AppColors.greyColor,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 0.03 * height),

                          // Title
                          Text(
                            model.title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),

                          SizedBox(height: 0.01 * height),

                          // Description
                          Text(
                            model.description,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          
                          // Bottom padding to ensure space between desc and button area
                          SizedBox(height: 0.08 * height),
                        ],
                      ),
                    ),
                  ),

                  // 2. Skip Button (Floating at the top)
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.06 * width),
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Visibility(
                          visible: !isLastPage, 
                          child: TextButton(
                            onPressed: onFinishOnBoarding,
                            child: Text(
                              l10n.skip,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 3. Next / Discover Button (Floating at the bottom)
                  Positioned(
                    bottom: 0.03 * height,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.06 * width),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart, 
                        child: ElevatedButton(
                          onPressed: onNext,
                          child: Directionality(
                            textDirection: TextDirection.rtl, 
                            child: Row(
                              mainAxisSize: MainAxisSize.min, 
                              children: [
                                Text(
                                  isLastPage ? l10n.discover_kouttab : l10n.next,
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.arrow_forward_ios, 
                                  color: AppColors.whiteColor,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}