import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/parts/quick_link_page.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/quick_link/presentation/widgets/button.dart';
import 'package:tasks/features/quick_link/presentation/widgets/icon.dart';

class QuickLinkPage extends StatelessWidget {
  const QuickLinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = DefaultStrings.instance;
    final theme = Theme.of(context);
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, size: SizeConfig.screenWidth * 0.06),
        leadingWidth: SizeConfig.screenWidth * 0.15,
        titleSpacing: 0,
        title: Text(
          s.quickLinkTitle,
          style: TextStyle(
            // color: const Color(0xff0D3E7F),
            fontSize: SizeConfig.screenWidth * 0.046,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.05,
          vertical: SizeConfig.screenWidth * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              s.quickLinkSubtitle,
              style: TextStyle(
                color: theme.colorScheme.secondary,
                fontSize: SizeConfig.screenWidth * 0.056,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              s.quickLinkSubtitle1,
              style: TextStyle(
                color: theme.colorScheme.secondary,
                fontSize: SizeConfig.screenWidth * 0.036,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            IconWidget(),
            Button(),
          ],
        ),
      ),
    );
  }
}
