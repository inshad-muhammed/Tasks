import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../core/constants/colors.dart';

class AliasListTile extends StatelessWidget {
  final String alias;
  final String status;
  final String account;
  final String iconPath;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const AliasListTile({
    super.key,
    required this.alias,
    required this.status,
    required this.iconPath,
    required this.account,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Slidable(
      key: ValueKey(alias),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.15,
        children: [
          SlidableAction(
            onPressed: (_) => () {},
            foregroundColor: Colors.redAccent,
            icon: Icons.delete_outline_rounded,
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: screenWidth * 0.06,
          backgroundColor: DefaultColors.dashboardBlue.withAlpha(51),
          child: SvgPicture.asset(iconPath, height: screenWidth * 0.05),
        ),
        title: Text(
          alias,
          style: const TextStyle(
            color: DefaultColors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              account,
              style: const TextStyle(
                color: DefaultColors.black,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            Text(
              status,
              style: const TextStyle(
                color: DefaultColors.gray102,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
