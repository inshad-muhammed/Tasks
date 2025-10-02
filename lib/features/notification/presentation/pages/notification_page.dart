import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/notification/presentation/pages/alerts_page.dart';
import 'package:tasks/features/notification/presentation/pages/pending_action_page.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back, size: SizeConfig.screenWidth * 0.06),
          leadingWidth: SizeConfig.screenWidth * 0.15,
          titleSpacing: 0,
          title: Text(
            "Notifications (2)",
            style: TextStyle(
              color: const Color(0xff0D3E7F),
              fontSize: SizeConfig.screenWidth * 0.045,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                height: SizeConfig.screenWidth * 0.08,
                width: SizeConfig.screenWidth * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    SizeConfig.screenWidth * 0.5,
                  ),
                  border: Border.all(color: Color(0xff446193)),
                ),
                child: Icon(
                  Icons.settings_outlined,
                  color: const Color(0xff446193),
                  size: SizeConfig.screenWidth * 0.06,
                ),
              ),
            ),
          ],
          bottom: TabBar(
            dividerColor: Colors.grey.withAlpha(100),
            indicatorColor: Color(0xff4197CB),
            indicatorPadding: EdgeInsetsGeometry.symmetric(
              horizontal: SizeConfig.screenWidth * 0.04,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.black,
            tabs: [
              Tab(text: "Pending Actions"),

              Tab(text: "Alerts"),
            ],
          ),
        ),
        body: TabBarView(children: [PendingActionPage(), AlertsPage()]),
      ),
    );
  }
}
