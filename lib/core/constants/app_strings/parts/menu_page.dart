import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/i18n_keys.dart';

extension MenuPageString on DefaultStrings {
  String get userName => get(I18nKeys().userName, fallback: "Alqabiadi");
  String get viewProfileButtonText =>
      get(I18nKeys().viewProfileButtonText, fallback: "View Profile");
  String get itemCard1Title =>
      get(I18nKeys().itemCard1Title, fallback: "Accounts");
  String get itemCard2Title =>
      get(I18nKeys().itemCard2Title, fallback: "Credit Cards");
  String get itemCard3Title =>
      get(I18nKeys().itemCard3Title, fallback: "Deposits");
  String get itemCard4Title =>
      get(I18nKeys().itemCard4Title, fallback: "Finance");
  String get requestsIconTitle =>
      get(I18nKeys().requestsIconTitle, fallback: "Requests");
  String get reachUsIconTitle =>
      get(I18nKeys().reachUsIconTitle, fallback: "Reach Us");
  String get logoutIconTitle =>
      get(I18nKeys().logoutIconTitle, fallback: "Logout");
  String get offerIconTitle =>
      get(I18nKeys().offerIconTitle, fallback: "Offers");
  String get referCardTitle =>
      get(I18nKeys().referCardTitle, fallback: "Refer and Earn");
  String get referCardDescription => get(
    I18nKeys().referCardDescription,
    fallback: "Exclusive Benefits Awaits You!",
  );
  String get referCardButtonText =>
      get(I18nKeys().referCardButtonText, fallback: "Apply Now");
  String get segmentedToggleTitle1 =>
      get(I18nKeys().segmentedToggleTitle1, fallback: "Theme");
  String get segmentedToggleTitle2 =>
      get(I18nKeys().segmentedToggleTitle2, fallback: "Language");
  String get toggleLanguageOption1 =>
      get(I18nKeys().toggleLanguageOption1, fallback: "English");
  String get toggleLanguageOption2 =>
      get(I18nKeys().toggleLanguageOption2, fallback: "عربي");
  String get botttomNavBarItem1 =>
      get(I18nKeys().botttomNavBarItem1, fallback: "Home");
  String get botttomNavBarItem2 =>
      get(I18nKeys().botttomNavBarItem2, fallback: "Offers");
  String get botttomNavBarItem3 =>
      get(I18nKeys().botttomNavBarItem3, fallback: "Pay");
  String get botttomNavBarItem4 =>
      get(I18nKeys().botttomNavBarItem4, fallback: "Wallet");
  String get botttomNavBarItem5 =>
      get(I18nKeys().botttomNavBarItem5, fallback: "Menu");
}
