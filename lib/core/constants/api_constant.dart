class ApiConstant {
  static const String baseUrl = "https://hosta-api.lenda-agency.com/api";
  static const String imageBaseUrl = "https://hosta-api.lenda-agency.com/";
  static const String loginEndpoint = "/login";
  static const String homeStatsEndpoint = "/provider/dashboard";
  static const String logoutEndpoint = "/logout";
  static const String registerEndpoint = "/register";
  static const String getLanguagesEndpoint = "/provider/languages";
  static const String setLanguagesEndpoint = "/provider/languages/set";
  static const String bookingEndpoint = "/client/bookings";
  static const String verifyOtpEndpoint = "/users/{user}/verify-otp";
  static const String resendOtpEndpoint = "/users/{user}/resend-otp";
  static const String meEndpoint = "/me";
  static const String updateProfileEndpoint = "/profile/update";
  static const String workingHoursEndpoint = "/provider/working-hours";
  static const String getServices = "/services";
  static const String setServices = "/provider-services";
  static const String getMyServices = "/provider-services";
  static const String citiesList = "/cities";
  static const String countryList = "/countries";
  static const String refreshTokenEndpoint = "/refresh-token";
  static const String categoryEndpoint = "/categories";
  static const String getProvidersEndpoint = "/client/providers";
  static const String postDeviceTokenEndpoint =
      "/notifications/register-device";
  static const String updateDeviceLanguageEndpoint =
      "/notifications/device-locale";

  static const String getNotificationsEndpoint = "/notifications";
  static const String timeSlotsEndpoint = "/availability/slots";
  static const String storeBookingEndpoint = "/client/bookings";
  static const String slidersEndpoint = "/client/app-sliders";
  static const String chatEndpoint = "/chat/conversations";
  static const String sendMessageEndpoint = "/chat/messages";
  static const String deleteAccountEndpoint = "/profile/account";
  static const String ticketsEndpoint = "/support/tickets";
  static const String requestResetPasswordEndpoint = "/password/request";
  static const String resetPasswordEndpoint = "/password/reset";
  static const String verifyOtpResetPasswordEndpoint = "/password/verify-otp";
  static const String resendResetPasswordOtpEndpoint = "/password/resend-otp";
  static const String searchEndpoint = "/services/search";
  static const String rateProviderEndpoint = "/client/provider/rate";
}
