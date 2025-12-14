import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/colors.dart';
import '../constants/requests_data.dart';
import '../controllers/filter_provider.dart';
import 'list_tile.dart';
import '../pages/request_details_page.dart';

class RequestList extends ConsumerWidget {
  const RequestList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(requestFilterProvider);
    final requestsList = filter == "received" ? receivedRequests : sentRequests;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: DefaultColors.gray102.withAlpha(51)),
      ),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final request = requestsList[index];

          return RequestListTile(
            isRecieved: filter == "received",
            name: request['name'],
            alias: request['alias'],
            expiresIn: request['expiry'],
            amount: request['amount'],
            status: request['status'],
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => RequestDetailsPage(request: request),
                ),
              );
            },
          );
        },
        separatorBuilder: (_, __) => Divider(height: 1),
        itemCount: requestsList.length,
      ),
    );
  }
}
