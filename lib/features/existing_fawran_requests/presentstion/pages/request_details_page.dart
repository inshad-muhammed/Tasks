import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/existing_fawran_requests/presentstion/widgets/buttons.dart';
import 'package:tasks/features/existing_fawran_requests/presentstion/widgets/fawran_success_popup.dart';
import 'package:tasks/features/existing_fawran_requests/presentstion/widgets/reject_popup.dart';
import 'package:tasks/features/existing_fawran_requests/presentstion/widgets/request_detail_card.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/filter_provider.dart';
import '../widgets/drag_handle.dart';

class RequestDetailsPage extends ConsumerWidget {
  final Map<String, dynamic> request;

  const RequestDetailsPage({super.key, required this.request});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final filter = ref.watch(requestFilterProvider);
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
          'Fawran Requests',
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: DefaultColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RequestDetailCard(
                name: request['name'],
                amount: request['amount'],
                date: request['date'],
                status: request['status'],
                isRecieved: filter == 'Received',
              ),
              SizedBox(height: screenHeight * 0.03),
              _detailsContainer(),
              SizedBox(height: screenHeight * 0.03),
              _feesCard(),
              Spacer(),

              TextButtonWidget(
                label: filter == 'received'
                    ? "X   Reject Request"
                    : "Cancel Request",

                onPressed: filter == 'received'
                    ? () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const DragHandle(),
                              RejectPopup(request: request),
                            ],
                          ),
                        );
                      }
                    : () {},
              ),
              SizedBox(height: screenHeight * 0.015),
              ElevatedButtonWidget(
                label: filter == 'received' ? "Approve and Transfer" : "Close",
                onPressed: filter == 'received'
                    ? () {
                        showModalBottomSheet(
                          useSafeArea: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (_) => FawranSuccessPopup(request: request),
                        );
                      }
                    : () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailsContainer() {
    final items = [
      ('Alias', request['alias']),
      ('Request expires on', request['date']),
      ('Remarks', request['remarks']),
      ('Purpose of transfer', request['purpose']),
      ('Sub Purpose of Transfer', request['subPurpose']),
      ('Total transfer amount', request['amount']),
    ];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: DefaultColors.gray102.withAlpha(51),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            _detailRow(items[i].$1, items[i].$2),
            if (i != items.length - 1)
              Divider(color: DefaultColors.gray102.withAlpha(51)),
          ],
        ],
      ),
    );
  }

  Widget _detailRow(String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: DefaultColors.gray102)),
          Text(value?.toString() ?? '-'),
        ],
      ),
    );
  }
}

Widget _feesCard() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: DefaultColors.blueLightBase.withAlpha(51),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Fees',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: DefaultColors.gray102,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '4.00 QAR.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: DefaultColors.black,
          ),
        ),
      ],
    ),
  );
}
