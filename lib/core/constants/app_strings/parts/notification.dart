import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/i18n_keys.dart';

extension NotificationPageString on DefaultStrings {
  String get pageTitle =>
      get(I18nKeys().notificationTitle, fallback: "Notifications");
  String get moreOption1 =>
      get(I18nKeys().moreOption1, fallback: "Select Notifications");
  String get moreOption2 =>
      get(I18nKeys().moreOption2, fallback: "More Options");
  String get section1 => get(I18nKeys().section1, fallback: "date");
  String get section2 => get(I18nKeys().section2, fallback: "notifications");
  String get promotionMessageTitle =>
      get(I18nKeys().promotionMessageTitle, fallback: "Promotion");
  String get promotionMessage => get(
    I18nKeys().promotionMessage,
    fallback: "Card Award Promotion Lorem Ipsum",
  );
  String get promotionMessageHighlight => get(
    I18nKeys().promotionMessageHighlight,
    fallback: "Card Award Promotion",
  );
  String get paymentRecieveMessageTitle =>
      get(I18nKeys().paymentRecieveMessageTitle, fallback: "Payment Received");
  String get paymentRecieveMessage => get(
    I18nKeys().paymentRecieveMessage,
    fallback:
        "You’ve just received 200.00 QAR in your account ending  •••• 9012",
  );
  String get paymentRecieveHighlight => get(
    I18nKeys().paymentRecieveHighlight,
    fallback: "received 200.00 QAR in your account ending  •••• 9012",
  );
  String get maintenanceMessageTitle =>
      get(I18nKeys().maintenanceMessageTitle, fallback: "Maintenance");
  String get maintenanceMessage => get(
    I18nKeys().maintenanceMessage,
    fallback:
        "Schedules Maintanences from 3 a.m. to 4 a.m. on Saturday, 13th January",
  );
  String get maintenanceMessageHighlight => get(
    I18nKeys().maintenanceMessageHighlight,
    fallback: "Schedules Maintanences",
  );
  String get utilityMessageTitle =>
      get(I18nKeys().utilityMessageTitle, fallback: "Payment Successful");
  String get utilityMessage => get(
    I18nKeys().utilityMessage,
    fallback:
        "Utility Payments - You’ve just pay 200.00 QAR for your account ending  •••• 9012",
  );
  String get utilityMessageHighlight =>
      get(I18nKeys().utilityMessageHighlight, fallback: "Utility Payments");
  String get payButtonText => get(I18nKeys().payButtonText, fallback: "Pay");
  String get markAsReadButtonText =>
      get(I18nKeys().markAsReadButtonText, fallback: "Mark as Read");
  String get deleteButtonText =>
      get(I18nKeys().deleteButtonText, fallback: "Delete Messages");
  String get selectAllButtonText =>
      get(I18nKeys().selectAllButtonText, fallback: "Select All");
  String get dateOfMessageToday =>
      get(I18nKeys().dateOfMessageToday, fallback: "Today");
  String get dateOfMessageYesterday =>
      get(I18nKeys().dateOfMessageYesterday, fallback: "Yesterday");
  String get dateOfMessageSep28 =>
      get(I18nKeys().dateOfMessageSep28, fallback: "Sep 28");
  String get filterOption1 => get(I18nKeys().filterOption1, fallback: "All");
  String get filterOption2 => get(I18nKeys().filterOption2, fallback: "Unread");
  String get filterOption3 => get(I18nKeys().filterOption3, fallback: "Read");
  String get timeOfMessage =>
      get(I18nKeys().timeOfMessage, fallback: "10:30 AM");
  String get snackBarMessage =>
      get(I18nKeys().snackBarMessage, fallback: "Messages Deleted");
}
