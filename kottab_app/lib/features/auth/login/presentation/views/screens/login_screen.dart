import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kottab_app/config/di/di.dart';
import 'package:kottab_app/core/resources/app_assets.dart';
import 'package:kottab_app/core/resources/app_colors.dart';
import 'package:kottab_app/core/validators/app_validators.dart';
import 'package:kottab_app/features/auth/login/presentation/view_model/login_events.dart';
import 'package:kottab_app/features/auth/login/presentation/view_model/login_states.dart';
import 'package:kottab_app/features/auth/login/presentation/view_model/login_view_model.dart';
import 'package:kottab_app/l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel=getIt<LoginViewModel>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        Image.asset(AppAssets.bgImage,width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
        BlocProvider<LoginViewModel>(
          create: (context) => viewModel,
          child: BlocConsumer<LoginViewModel,LoginStates>(
            builder: (context, state) {
              return SafeArea(
                child: Scaffold(
                  backgroundColor: AppColors.transparentColor,
                  body: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 0.05*height,bottom: 0.04*height,left: 0.04*width,right: 0.05*width),
                    child: Container(
                      width: double.infinity,
                      height: 0.99*height,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(0.1*width)
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            top: 0.06*height,
                            child: Image.asset(AppAssets.wireImage)
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsetsGeometry.only(left: 0.055*width),
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Row(
                                    children: [
                                      Image.asset(AppAssets.decorationImage,width: 0.26*width,height: 0.13*height,),
                                      SizedBox(width: 0.07*width,),
                                      Image.asset(AppAssets.kouttabLogo,width: 0.2*width,height: 0.09*height,),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 0.01*height,),
                              Text(AppLocalizations.of(context)!.login,style: Theme.of(context).textTheme.titleLarge,),
                              SizedBox(height: 0.01*height,),
                              SizedBox(width: 0.6*width,child: Text(AppLocalizations.of(context)!.login_greeting,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,)),
                              SizedBox(height: 0.09*height,),
                              Form(
                                key: _formKey,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0.04*width,right: 0.12*width),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text(AppLocalizations.of(context)!.email,style: Theme.of(context).textTheme.titleSmall,),
                                      SizedBox(height: 0.01*height,),
                                      TextFormField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.email_outlined,color: AppColors.darkGreyTextColor,),
                                          hintText: AppLocalizations.of(context)!.enter_your_email
                                        ),
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          return AppValidators.validateEmail(value, context);
                                        },
                                      ),
                                      SizedBox(height: 0.02*height,),
                                      Text(AppLocalizations.of(context)!.password,style: Theme.of(context).textTheme.titleSmall,),
                                      SizedBox(height: 0.01*height,),
                                      TextFormField(
                                        controller: passwordController,
                                        obscureText: state.isPasswordHidden!,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.lock_outline_rounded),
                                          hintText:AppLocalizations.of(context)!.enter_password,
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              viewModel.doIntent(TogglePasswordVisibilityEvent());
                                            }, 
                                            icon: Icon(state.isPasswordHidden==true?Icons.visibility_outlined:Icons.visibility_off_outlined,color: AppColors.darkGreyTextColor,)
                                          )
                                        ),
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          return AppValidators.validatePassword(value, context);
                                        },
                                      ),
                                      SizedBox(height: 0.01*height,),
                                      InkWell(
                                        onTap: () {
                                          
                                        },
                                        child: Text(AppLocalizations.of(context)!.forgot_password_question,style: Theme.of(context).textTheme.labelMedium,)
                                      ),
                                      SizedBox(height: 0.09*height,),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if(_formKey.currentState?.validate()==true){

                                            }
                                          }, 
                                          child: Text(AppLocalizations.of(context)!.login)
                                        ),
                                      ),
                                      SizedBox(height: 0.03*height,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Divider(
                                              color: AppColors.textFieldBorderColor,
                                              indent: 0.02*width,
                                              endIndent: 0.06*width,
                                            ),
                                          ),
                                          Text(AppLocalizations.of(context)!.or,style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w400),),
                                          Expanded(
                                            child: Divider(
                                              color: AppColors.textFieldBorderColor,
                                              indent: 0.06*width,
                                              endIndent: 0.02*width,
                                            )
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 0.01*height,),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: AppColors.darkGreenColor,
                                            backgroundColor: AppColors.whiteColor,
                                            padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadiusGeometry.circular(16),
                                              side: BorderSide(color: AppColors.darkGreenColor)
                                            )
                                          ),
                                          onPressed: () {
                                            
                                          }, 
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset(AppAssets.googleIcon),
                                              SizedBox(width: 0.04*width,),
                                              Text(AppLocalizations.of(context)!.continue_with_google,style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.darkGreenColor),)
                                            ],
                                          )
                                        ),
                                      ),
                                      SizedBox(height: 0.04*height,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(AppLocalizations.of(context)!.do_not_have_account,style: Theme.of(context).textTheme.headlineSmall,),
                                          SizedBox(width: 0.01*width,),
                                          InkWell(
                                            onTap: () {
                                              
                                            },
                                            child: Text(AppLocalizations.of(context)!.create_new_account,style: Theme.of(context).textTheme.headlineLarge,)
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              );
            }, 
            listener: (context, state) {
              
            },
          ),
        )
      ],
    );
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}