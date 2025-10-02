import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/notification/presentation/widgets/filter_bar.dart';
import 'package:tasks/features/notification/presentation/widgets/notification_card.dart';
import 'package:tasks/features/notification/presentation/widgets/section_header.dart';

class PendingActionPage extends StatelessWidget {
  const PendingActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.screenWidth * 0.04),
        child: ListView(
          children: [
            FilterBar(),
            SizedBox(height: SizeConfig.screenWidth * 0.05),
            //Today
            SectionHeader("Today"),
            SizedBox(height: SizeConfig.screenWidth * 0.02),
            NotificationCard(
              time: "17:30",

              message:
                  "Your Recent Transaction of 230 QAR at Pizzapoint has been succesful",
              highlights: ["Transaction of 230 QAR", "Pizzapoint"],
              notificationtype: 'check',
            ),
            SizedBox(height: SizeConfig.screenWidth * 0.02),
            NotificationCard(
              message: "Alqabiadi Requested a payment of 178 QAR",
              highlights: ["178 QAR"],
              time: "",
              unread: true,
              showButton: true,
              notificationtype: 'request',
            ),
            SizedBox(height: SizeConfig.screenWidth * 0.02),
            NotificationCard(
              message:
                  "Exclusive offer for you on Credit cards and Deposit accounts",
              highlights: [],
              unread: true,
              time: "",
              notificationtype: "percentage",
            ),
            SizedBox(height: SizeConfig.screenWidth * 0.02),
            NotificationCard(
              message:
                  "Your Monthly Account Statement for September 2025 is now available",
              highlights: ["Statement for September 2025"],
              time: "",
              notificationtype: "statement",
            ),
            SizedBox(height: SizeConfig.screenWidth * 0.05),
            //Yesterday
            SectionHeader("Yesterday"),
            SizedBox(height: SizeConfig.screenWidth * 0.02),
            NotificationCard(
              time: "17:30",

              message:
                  "Your Recent Transaction of 230 QAR at Pizzapoint has been succesful",
              highlights: ["Transaction of 230 QAR", "Pizzapoint"],
              notificationtype: 'check',
            ),
            SizedBox(height: SizeConfig.screenWidth * 0.02),
            NotificationCard(
              message: "Alqabiadi Requested a payment of 178 QAR",
              highlights: ["178 QAR"],
              time: "",
              showButton: true,
              notificationtype: 'request',
            ),
            SizedBox(height: SizeConfig.screenWidth * 0.02),
            NotificationCard(
              message:
                  "Exclusive offer for you on Credit cards and Deposit accounts",
              highlights: [],
              time: "",
              notificationtype: "percentage",
            ),
            SizedBox(height: SizeConfig.screenWidth * 0.02),
            NotificationCard(
              message:
                  "Your Monthly Account Statement for September 2025 is now available",
              highlights: ["Statement for September 2025"],
              time: "",
              notificationtype: "statement",
            ),
            SizedBox(height: SizeConfig.screenWidth * 0.05),
            //28th September
            SectionHeader("28th September"),
            SizedBox(height: SizeConfig.screenWidth * 0.02),
            NotificationCard(
              time: "17:30",

              message:
                  "Your Recent Transaction of 230 QAR at Pizzapoint has been succesful",
              highlights: ["Transaction of 230 QAR", "Pizzapoint"],
              notificationtype: 'check',
            ),
            SizedBox(height: SizeConfig.screenWidth * 0.02),
            NotificationCard(
              message: "Alqabiadi Requested a payment of 178 QAR",
              highlights: ["178 QAR"],
              time: "",
              showButton: true,
              notificationtype: 'request',
            ),
            SizedBox(height: SizeConfig.screenWidth * 0.02),
            NotificationCard(
              message:
                  "Exclusive offer for you on Credit cards and Deposit accounts",
              highlights: [],
              time: "",
              notificationtype: "percentage",
            ),
            SizedBox(height: SizeConfig.screenWidth * 0.02),
            NotificationCard(
              message:
                  "Your Monthly Account Statement for September 2025 is now available",
              highlights: ["Statement for September 2025"],
              time: "",
              notificationtype: "statement",
            ),
          ],
        ),
      ),
    );
  }
}
