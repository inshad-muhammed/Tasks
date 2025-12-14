import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasks/features/existing_fawran_requests/presentstion/widgets/drag_handle.dart';
import '../../../../core/constants/colors.dart';
import 'buttons.dart';

class FawranSuccessPopup extends StatelessWidget {
  final Map<String, dynamic> request;
  const FawranSuccessPopup({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DragHandle(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset("assets/task_success.gif", height: 100),
                    SizedBox(height: 16),
                    Text(
                      "transfer Successful",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(DateTime.now().toString()),
                    SizedBox(height: 16),
                    _detailsContainer(context),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButtonWidget(
                          label: "Share as PDF",
                          iconPath: "assets/fawran_icons/share.svg",
                          onPressed: () {},
                        ),
                        TextButtonWidget(
                          label: "Share as image",
                          iconPath: "assets/fawran_icons/share.svg",
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    RepeatTransferButton(onPressed: () {}),
                    SizedBox(height: 16),
                    ElevatedButtonWidget(
                      label: "Close",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailsContainer(BuildContext context) {
    final items = [
      ('From Account', 'QA90BRWA0000020000326380', false),
      ('Beneficiary Alias Type', request['alias_type'], false),
      ('Reference Number', 'ABCDE12345', true),
      ('Amount', request['amount'], false),
      ('Total transfer amount', request['amount'] + ' + 4.00 QAR', false),
      ('Purpose of transfer', request['purpose'], false),
      ('Sub Purpose of Transfer', request['subPurpose'], false),
      ('Remarks', request['remarks'], false),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < items.length; i++) ...[
            _detailColumn(
              context,
              items[i].$1,
              items[i].$2,
              isCopyable: items[i].$3,
            ),
            if (i != items.length - 1)
              Divider(color: DefaultColors.gray102.withAlpha(51)),
          ],
        ],
      ),
    );
  }

  Widget _detailColumn(
    BuildContext context,
    String title,
    dynamic value, {
    bool isCopyable = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: DefaultColors.gray102)),

          const SizedBox(height: 4),

          Row(
            children: [
              Expanded(
                child: Text(
                  value?.toString() ?? '-',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),

              if (isCopyable)
                GestureDetector(
                  onTap: () => _copyToClipboard(context, value?.toString()),
                  child: const Icon(Icons.copy, size: 18, color: Colors.blue),
                ),
            ],
          ),
        ],
      ),
    );
  }

  void _copyToClipboard(BuildContext context, String? text) {
    Clipboard.setData(ClipboardData(text: text ?? ""));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          "Copied to clipboard",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
