import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/parts/notification.dart';

final s = DefaultStrings.instance;
final List<Map<String, dynamic>> notificationSections = [
  {
    s.section1: s.dateOfMessageToday,
    s.section2: [
      {
        "id": "notif_1",
        "title": s.promotionMessageTitle,
        "time": s.timeOfMessage,
        "message": s.promotionMessage,
        "highlights": [s.promotionMessageHighlight],
        "notificationtype": "card",
      },
      {
        "id": "notif_2",
        "title": s.paymentRecieveMessageTitle,
        "time": s.timeOfMessage,
        "message": s.paymentRecieveMessage,
        "highlights": [s.paymentRecieveHighlight],
        "notificationtype": "invoice",
        "unread": true,
      },
      {
        "id": "notif_3",
        "title": s.maintenanceMessageTitle,
        "time": s.timeOfMessage,
        "message": s.maintenanceMessage,
        "highlights": [s.maintenanceMessageHighlight],
        "notificationtype": "maintenance",
        "unread": true,
      },
      {
        "id": "notif_4",
        "title": s.utilityMessageTitle,
        "time": s.timeOfMessage,
        "message": s.utilityMessage,
        "highlights": [s.utilityMessageHighlight],
        "notificationtype": "request",
      },
    ],
  },
  {
    s.section1: s.dateOfMessageYesterday,
    s.section2: [
      {
        "id": "notif_5",
        "title": s.promotionMessageTitle,
        "time": s.timeOfMessage,
        "message": s.promotionMessage,
        "highlights": [s.promotionMessageHighlight],
        "notificationtype": "card",
      },
      {
        "id": "notif_6",
        "title": s.paymentRecieveMessageTitle,
        "time": s.timeOfMessage,
        "message": s.paymentRecieveMessage,
        "highlights": [s.paymentRecieveHighlight],
        "notificationtype": "invoice",
        "unread": true,
      },
      {
        "id": "notif_7",
        "title": s.maintenanceMessageTitle,
        "time": s.timeOfMessage,
        "message": s.maintenanceMessage,
        "highlights": [s.maintenanceMessageHighlight],
        "notificationtype": "maintenance",
        "unread": true,
      },
      {
        "id": "notif_8",
        "title": s.utilityMessageTitle,
        "time": s.timeOfMessage,
        "message": s.utilityMessage,
        "highlights": [s.utilityMessageHighlight],
        "notificationtype": "request",
      },
    ],
  },
  {
    s.section1: s.dateOfMessageSep28,
    s.section2: [
      {
        "id": "notif_9",
        "title": s.promotionMessageTitle,
        "time": s.timeOfMessage,
        "message": s.promotionMessage,
        "highlights": [s.promotionMessageHighlight],
        "notificationtype": "card",
      },
      {
        "id": "notif_10",
        "title": s.paymentRecieveMessageTitle,
        "time": s.timeOfMessage,
        "message": s.paymentRecieveMessage,
        "highlights": [s.paymentRecieveHighlight],
        "notificationtype": "invoice",
        "unread": true,
      },
      {
        "id": "notif_11",
        "title": s.maintenanceMessageTitle,
        "time": s.timeOfMessage,
        "message": s.maintenanceMessage,
        "highlights": [s.maintenanceMessageHighlight],
        "notificationtype": "maintenance",
        "unread": true,
      },
      {
        "id": "notif_12",
        "title": s.utilityMessageTitle,
        "time": s.timeOfMessage,
        "message": s.utilityMessage,
        "highlights": [s.utilityMessageHighlight],
        "notificationtype": "request",
      },
    ],
  },
];
