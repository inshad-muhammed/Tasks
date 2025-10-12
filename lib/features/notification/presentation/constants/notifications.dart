import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/parts/notification.dart';

final s = DefaultStrings.instance;
final List<Map<String, dynamic>> notificationSections = [
  {
    s.section1: s.dateOfMessageToday,
    s.section2: [
      {
        "id": "notif_1",
        "time": s.timeOfMessage,
        "message": s.successfulTransactionMessage,
        "highlights": [
          s.succesfulTransactionHighlight1,
          s.succesfulTransactionHighlight2,
        ],
        "notificationtype": "check",
      },
      {
        "id": "notif_2",
        "message": s.paymentRequestMessage,
        "highlights": [s.paymentRequestHighlight],
        "notificationtype": "request",
        "unread": true,
        "showButton": true,
      },
      {
        "id": "notif_3",
        "message": s.creditOfferMessage,
        "highlights": [],
        "notificationtype": "percentage",
        "unread": true,
      },
      {
        "id": "notif_4",
        "message": s.accountStatementMessage,
        "highlights": [s.accountStatementHighlight],
        "notificationtype": "statement",
      },
    ],
  },
  {
    s.section1: s.dateOfMessageYesterday,
    s.section2: [
      {
        "id": "notif_1",
        "time": s.timeOfMessage,
        "message": s.successfulTransactionMessage,
        "highlights": [
          s.succesfulTransactionHighlight1,
          s.succesfulTransactionHighlight2,
        ],
        "notificationtype": "check",
      },
      {
        "id": "notif_2",
        "message": s.paymentRequestMessage,
        "highlights": [s.paymentRequestHighlight],
        "notificationtype": "request",
        "unread": true,
        "showButton": true,
      },
      {
        "id": "notif_3",
        "message": s.creditOfferMessage,
        "highlights": [],
        "notificationtype": "percentage",
        "unread": true,
      },
      {
        "id": "notif_4",
        "message": s.accountStatementMessage,
        "highlights": [s.accountStatementHighlight],
        "notificationtype": "statement",
      },
    ],
  },
  {
    s.section1: s.dateOfMessageSep28,
    s.section2: [
      {
        "id": "notif_1",
        "time": s.timeOfMessage,
        "message": s.successfulTransactionMessage,
        "highlights": [
          s.succesfulTransactionHighlight1,
          s.succesfulTransactionHighlight2,
        ],
        "notificationtype": "check",
      },
      {
        "id": "notif_2",
        "message": s.paymentRequestMessage,
        "highlights": [s.paymentRequestHighlight],
        "notificationtype": "request",
        "unread": true,
        "showButton": true,
      },
      {
        "id": "notif_3",
        "message": s.creditOfferMessage,
        "highlights": [],
        "notificationtype": "percentage",
        "unread": true,
      },
      {
        "id": "notif_4",
        "message": s.accountStatementMessage,
        "highlights": [s.accountStatementHighlight],
        "notificationtype": "statement",
      },
    ],
  },
];
