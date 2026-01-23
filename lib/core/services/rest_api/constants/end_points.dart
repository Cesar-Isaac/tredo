// ignore_for_file: constant_identifier_names, non_constant_identifier_names

abstract class EndPoints {
  //##########  Base Url  ##########
  static const String baseUrl = 'http://94.72.98.154:8085/api/';

  //Auth
  static const login = "auth/login";
  static const register = "auth/register";
  static const Verify = "auth/verify-code";
  static const resent_otp = "auth/resend-code";
  static const update_profile = "auth/update-profile";
  static const forget_password = "auth/forget-password";
  static const reset_password = "auth/reset-password";
  static const log_out = "auth/logout";

  // Content
  static const profile = "auth/profile";
  static const change_password = "auth/change-password";
  static const sliders = "sliders";
  static const cities = "cities";
  static const providers = "service-providers";
  static const goverment_entities = "goverment-entities";
  static const categories = "categories";
  static const subCategories = "sub-categories";
  static const offers = "offers";
  static const contact_us = "contacts";
  static const notifications = "notifications";



  
}
