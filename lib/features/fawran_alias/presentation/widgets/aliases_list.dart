import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/fawran_alias/presentation/widgets/list_tile.dart';
import '../../../../core/constants/colors.dart';
import '../pages/alias_details_page.dart';

class AliasesList extends ConsumerWidget {
  const AliasesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final filter = ref.watch(aliasFilterProvider);

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: DefaultColors.gray102.withAlpha(51)),
        ),
        child: ListView.separated(
          itemBuilder: (context, index) {
            final alias = aliasesList[index];

            return Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: AliasListTile(
                alias: alias['alias'],
                status: alias['status'],
                account: alias['account'],
                iconPath: alias['iconPath'],
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AliasDetailsPage(aliasData: alias),
                    ),
                  );
                },
              ),
            );
          },
          separatorBuilder: (_, __) => Divider(height: 1),
          itemCount: aliasesList.length,
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> aliasesList = [
  {
    'alias': '9748872627',
    'account': 'Saving Account xxxx2088',
    'number': '9748872627',
    'status': 'ACTIVE',
    'iconPath': 'assets/fawran_icons/mobile.svg',
    'createdAt': '14-Oct • 10:30 AM',
  },
  {
    'alias': '9748872627',
    'account': 'Saving Account xxxx2088',
    'number': '9748872627',
    'status': 'ACTIVE',
    'iconPath': 'assets/fawran_icons/iban.svg',
    'createdAt': '14-Oct • 10:30 AM',
  },
];
