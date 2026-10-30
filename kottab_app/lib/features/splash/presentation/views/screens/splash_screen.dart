import 'package:flutter/material.dart';
import 'package:kottab_app/core/resources/app_assets.dart';
import 'package:kottab_app/core/resources/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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