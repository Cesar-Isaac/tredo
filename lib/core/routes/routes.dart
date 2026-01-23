// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tredo/feature/Auth/forget_password/index.dart';
import 'package:tredo/feature/Auth/login/index.dart';
import 'package:tredo/feature/Auth/reset_password/index.dart';
import 'package:tredo/feature/Auth/signup/index.dart';
import 'package:tredo/feature/Auth/verify/index.dart';
import 'package:tredo/feature/all_categories/index.dart';
import 'package:tredo/feature/main/index.dart';
import 'package:tredo/feature/notifications/index.dart';
import 'package:tredo/feature/provider_details/index.dart';
import 'package:tredo/feature/splash_screen/index.dart';

import '../../feature/change_password/index.dart';
import '../../feature/contact_us/index.dart';
import '../../feature/settings/edit/index.dart';

class AppRouting {
  static GetPage unknownRoute = GetPage(
    name: "/unknown",
    page: () => SizedBox(),
  );

  static GetPage initialRoute = GetPage(name: "/", page: () => SplashScreen());

  static List<GetPage> routes = [
    initialRoute,
    ...Pages.values.map((e) => e.page),
  ];
}

enum Pages {
  //Auth
  login,
  signup,
  forget_password,
  reset_password,
  verifiy,
  //
  main,
  edit_profile,
  change_password,
  all_categories,
  provider_details,
  contact_us,
  notification_page

  ;
  // rating_page,

  String get value => '/$name';

  GetPage get page => switch (this) {
    //  Auth

    login => GetPage(name: value, page: () => LoginPage()),
    signup => GetPage(name: value, page: () => SignUpPage()),
    verifiy => GetPage(name: value, page: () => VerifyPage()),
    forget_password => GetPage(name: value, page: () => ForgetPasswordPage()),
    reset_password => GetPage(name: value, page: () => ResetPasswordPage()),

     // Nav pages
    main => GetPage(name: value, page: () => MainPage()),
    edit_profile => GetPage(name: value, page: () => EditeProfile()),
    all_categories => GetPage(name: value, page: ()=> AllCategories()),
    provider_details => GetPage(name: value, page: ()=> ProviderDatails()),
    contact_us => GetPage(name: value, page: ()=> ContactUsPage()),

    // Pages
   change_password => GetPage(name: value,page: ()=> ChangePassword()),
   notification_page => GetPage(name: value, page: ()=> NotificationsPage())

    
    
  };
}
