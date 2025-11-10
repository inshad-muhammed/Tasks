import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constants/colors.dart';
import '../controller/loading_provider.dart';
import '../widgets/icon.dart';
import '../widgets/shimmer_effect.dart';

class QuickLinkPage extends ConsumerWidget {
  const QuickLinkPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingProvider);
    return Scaffold(
      backgroundColor: DefaultColors.dashboardGray,
      appBar: AppBar(
        toolbarHeight: 64,
        leading: Icon(Icons.arrow_back_ios, size: 20),

        titleSpacing: 0,
        title: Text(
          "Customize Quick Links",
          style: TextStyle(
            color: DefaultColors.dashboarddarkBlue,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: isLoading
          ? Shimmer.fromColors(
              baseColor: DefaultColors.white_500,
              highlightColor: DefaultColors.white_600,
              child: ShimmerEffect(),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select upto 4 Options",
                    style: TextStyle(
                      color: DefaultColors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "You want have quick access to",
                    style: TextStyle(
                      color: DefaultColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16),
                  IconWidget(),
                ],
              ),
            ),
    );
  }
}
