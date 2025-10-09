import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/i18n_keys.dart';

extension NotificationPageString on DefaultStrings {
  String get pageTitle =>
      get(I18nKeys().notificationTitle, fallback: "Notifications");
  String get emptyStateTitle =>
      get(I18nKeys().moreOption1, fallback: "Select Notifications");
  String get emptyStateSubtitle =>
      get(I18nKeys().moreOption2, fallback: "More Options");
  String get emptyStateButtonText => get(
    I18nKeys().succesfulTransactionMessage,
    fallback:
        "Your Recent Transaction of 230 QAR at Pizzapoint has been succesful",
  );
  String get succesfulTransactionHighlight1 => get(
    I18nKeys().succesfulTransactionHighlight1,
    fallback: "Transaction of 230 QAR",
  );
  String get succesfulTransactionHighlight2 =>
      get(I18nKeys().succesfulTransactionHighlight2, fallback: "Pizzapoint");
  String get paymentRequestMessage => get(
    I18nKeys().paymentRequestMessage,
    fallback: "Alqabiadi Requested a payment of 178 QAR",
  );
  String get paymentRequestHighlight =>
      get(I18nKeys().paymentRequestHighlight, fallback: "178 QAR");
  String get creditOfferMessage => get(
    I18nKeys().creditOfferMessage,
    fallback: "Exclusive offer for you on Credit cards and Deposit accounts",
  );
  String get accountStatementMessage => get(
    I18nKeys().accountStatementMessage,
    fallback:
        "Your Monthly Account Statement for September 2025 is now available",
  );
  String get accountStatementHighlight => get(
    I18nKeys().accountStatementHighlight,
    fallback: "Statement for September 2025",
  );
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
}
