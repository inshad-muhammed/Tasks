import 'package:flutter/material.dart';
import 'package:tasks/features/fawran_alias/presentation/widgets/aliases_list.dart';
import 'package:tasks/features/fawran_alias/presentation/widgets/filter_bar.dart';
import '../../../../core/constants/colors.dart';

class OwnAliasPage extends StatelessWidget {
  const OwnAliasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: DefaultColors.blueT1,
      appBar: AppBar(
        backgroundColor: DefaultColors.blueT1,
        foregroundColor: DefaultColors.white,
        leadingWidth: screenWidth * 0.05,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: screenWidth * 0.05),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Your Aliases',
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: DefaultColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: screenWidth * 0.05),
            FilterBar(),
            Expanded(child: AliasesList()),
          ],
        ),
      ),
    );
  }
}
