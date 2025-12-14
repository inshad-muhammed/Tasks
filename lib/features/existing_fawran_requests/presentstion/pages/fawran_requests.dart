import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/existing_fawran_requests/presentstion/widgets/filter_bar.dart';
import 'package:tasks/features/existing_fawran_requests/presentstion/widgets/request_list.dart';
import '../../../../core/constants/colors.dart' show DefaultColors;

class FawranRequestsPage extends ConsumerWidget {
  const FawranRequestsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: DefaultColors.blueT1,
      appBar: AppBar(
        backgroundColor: DefaultColors.blueT1,
        foregroundColor: DefaultColors.white,
        leadingWidth: 20,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Fawran Requests',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: screenHeight * 0.04,
          left: screenWidth * 0.04,
          right: screenWidth * 0.04,
        ),
        decoration: const BoxDecoration(
          color: DefaultColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FilterBar(),
              SizedBox(height: screenHeight * 0.02),
              Expanded(child: RequestList()),
            ],
          ),
        ),
      ),
    );
  }
}
