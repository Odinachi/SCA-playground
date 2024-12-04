import 'package:flutter/material.dart';
import 'package:secondapp/shared/app_colors.dart';

final emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

const textStyle = TextStyle(
  fontFamily: "Gilroy",
  fontWeight: FontWeight.w500,
  color: AppColors.black,
);
