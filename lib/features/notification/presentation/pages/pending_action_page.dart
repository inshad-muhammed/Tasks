import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/notification/presentation/constants/notifications.dart';
import 'package:tasks/features/notification/presentation/widgets/filter_bar.dart';
import 'package:tasks/features/notification/presentation/widgets/notification_card.dart';
import 'package:tasks/features/notification/presentation/widgets/section_header.dart';

class PendingActionPage extends StatelessWidget {
  const PendingActionPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.screenWidth * 0.04,
          left: SizeConfig.screenWidth * 0.04,
          right: SizeConfig.screenWidth * 0.04,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FilterBar(),
              SizedBox(height: SizeConfig.screenWidth * 0.05),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: notificationSections.length,
                itemBuilder: (context, sectionIndex) {
                  final section = notificationSections[sectionIndex];
                  final sectionTitle = section["date"];
                  final List notifications = section["notifications"];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (sectionIndex != 0)
                        SizedBox(height: SizeConfig.screenWidth * 0.05),
                      SectionHeader(sectionTitle),
                      SizedBox(height: SizeConfig.screenWidth * 0.02),
                      ...notifications.map<Widget>((notif) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: SizeConfig.screenWidth * 0.02,
                          ),
                          child: NotificationCard(
                            message: notif["message"],
                            time: notif["time"] ?? "",
                            highlights: List<String>.from(
                              notif["highlights"] ?? [],
                            ),
                            notificationtype: notif["notificationtype"],
                            unread: notif["unread"] ?? false,
                            showButton: notif["showButton"] ?? false,
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
