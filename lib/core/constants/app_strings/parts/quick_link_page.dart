import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/i18n_keys.dart';

extension QuickLinkPageString on DefaultStrings {
  String get quickLinkTitle =>
      get(I18nKeys().quickLinkTitle, fallback: "Customize Quick Links");
  String get quickLinkSubtitle =>
      get(I18nKeys().quickLinkSubtitle, fallback: "Select upto 4 Options");
  String get quickLinkSubtitle1 => get(
    I18nKeys().quickLinkSubtitle1,
    fallback: "You want have quick acces to",
  );
  String get label1 => get(I18nKeys().quickLinkLabel1, fallback: "EIPO");
  String get label2 => get(I18nKeys().quickLinkLabel2, fallback: "Transfer");
  String get label3 => get(I18nKeys().quickLinkLabel3, fallback: "Stocks");
  String get label4 => get(I18nKeys().quickLinkLabel4, fallback: "Investments");
  String get label5 => get(I18nKeys().quickLinkLabel5, fallback: "Products");
  String get label6 => get(I18nKeys().quickLinkLabel6, fallback: "St. Orders");
  String get label7 => get(I18nKeys().quickLinkLabel7, fallback: "Requests");
  String get label8 =>
      get(I18nKeys().quickLinkLabel8, fallback: "Quick Link Label");
  String get buttonText =>
      get(I18nKeys().quickLinkButtonText, fallback: "Done");
}
