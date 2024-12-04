import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secondapp/shared/app_colors.dart';
import 'package:secondapp/shared/assets.dart';

import '../../shared/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool showClear = false;
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.backgroundPng,
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Sign In to recharge Direct",
                    textAlign: TextAlign.center,
                    style: textStyle.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextInputWidget(
                    controller: _emailController,
                    onChanged: (input) {
                      if (input.isEmpty) {
                        showClear = false;
                      } else {
                        showClear = true;
                      }

                      setState(() {});
                    },
                    label: "Enter Email",
                    suffixIcon: showClear
                        ? GestureDetector(
                            onTap: () {
                              _emailController.clear();
                              showClear = false;
                              setState(() {});
                            },
                            child: SvgPicture.asset(
                              AppAssets.closeIconSvg,
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInputWidget(
                    controller: _passwordController,
                    label: "Enter Password",
                    obscureText: hidePassword,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        hidePassword = !hidePassword;
                        setState(() {});
                      },
                      child: SvgPicture.asset(
                        hidePassword
                            ? AppAssets.visibilitySvg
                            : AppAssets.visibilityOffSvg,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Recover Password ?",
                          style: textStyle.copyWith(
                              color: AppColors.lightGray, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.appBlue.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: AppColors.appBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: textStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Divider(
                            color: AppColors.borderColor,
                          ),
                        ),
                      ),
                      Text(
                        "Or continue with",
                        style: textStyle.copyWith(
                            fontSize: 13, color: AppColors.lightGray),
                      ),
                      const Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Divider(
                          color: AppColors.borderColor,
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SocialLoginButton(
                          assetPath: AppAssets.googleSvg,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: SocialLoginButton(
                          assetPath: AppAssets.appleIcon,
                          showShadow: true,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: SocialLoginButton(
                          assetPath: AppAssets.facebookSvg,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "if you don’t an account you can ",
                            style: textStyle.copyWith(
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Clicked on register ");
                              },
                            text: "Register here!",
                            style: textStyle.copyWith(
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                              color: AppColors.appBlue,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      this.callback,
      required this.assetPath,
      this.showShadow = false});

  final String assetPath;
  final VoidCallback? callback;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: AppColors.gray.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: SvgPicture.asset(assetPath),
      ),
    );
  }
}

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    super.key,
    this.controller,
    this.suffixIcon,
    this.validate,
    this.label,
    this.onChanged,
    this.obscureText = false,
  });

  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String? label;
  final String? Function(String?)? validate;
  final void Function(String)? onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      controller: controller,
      validator: validate,
      cursorColor: AppColors.appBlue,
      style: textStyle.copyWith(
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: suffixIcon,
            ),
          ],
        ),
        fillColor: AppColors.white,
        filled: true,
        labelStyle: textStyle.copyWith(
          color: AppColors.gray,
          fontWeight: FontWeight.w300,
          fontSize: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.appBlue,
          ),
        ),
      ),
    );
  }
}
