import 'package:tasks/core/constants/app_strings/default_string.dart';

extension WidgetCustomisationStrings on DefaultStrings {
  String get widgetCustomisationTitle =>
      get("widgetCustomisationTitle", fallback: "Widget Customisation");
  String get header => get("widgetCustomisationHeader", fallback: "Pinned");
  String get pinnedItem1 => get("pinnedItem1", fallback: "Active Billers");
  String get pinnedItem2 => get("pinnedItem2", fallback: "Card Spend");
  String get pinnedItem3 => get("pinnedItem3", fallback: "Credit Card Bill");
  String get activeBillerCardTitle =>
      get("activeBillerCardTitle", fallback: "No Billers added!");
  String get activeBillerCardDescription => get(
    "activeBillerCardDescription",
    fallback: "Add to manage billers right from your dashboard.",
  );
  String get cardSpendTitle =>
      get("cardSpendTitle", fallback: "Your recent spends");
  String get cardSpendDescription =>
      get("cardSpendDescription", fallback: "Nothing to track here yet");
  String get cardSpendButtonText =>
      get("cardSpendButtonText", fallback: "View all spends");
  String get creditCardbillDescription =>
      get("creditCardbillDescription", fallback: "No bills to show yet");
}
