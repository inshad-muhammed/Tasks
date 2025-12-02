import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks/features/dashbord/presentation/widgets/drag_handle.dart';

import '../../../../core/constants/colors.dart';
import '../../domain/models/bottom_sheet_item.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final String? subTitle;
  final List<BottomSheetItem> itemList;

  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.itemList,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        bottom: screenWidth * 0.05,
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DragHandle(),
          SizedBox(height: screenHeight * 0.02),
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w600,
              color: DefaultColors.blackT,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          BottomSheetList(items: itemList),
        ],
      ),
    );
  }
}

class BottomSheetList extends StatelessWidget {
  final List<BottomSheetItem> items;

  BottomSheetList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => Divider(),
      itemBuilder: (context, index) {
        final item = items[index];

        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: DefaultColors.dashboardBlue.withAlpha(51),
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: SvgPicture.asset(
                item.leadingIcon,
                height: screenWidth * 0.05,
              ),
            ),
          ),
          title: Text(
            item.label,
            style: TextStyle(
              fontSize: screenWidth * 0.038,
              fontWeight: FontWeight.w600,
              color: DefaultColors.blackT,
            ),
          ),
          subtitle: item.subLabel != null
              ? Text(
                  item.subLabel!,
                  style: TextStyle(
                    fontSize: screenWidth * 0.032,
                    fontWeight: FontWeight.w500,
                    color: DefaultColors.grayTB,
                  ),
                )
              : null,
          trailing: _buildTrailing(item),
          onTap: () {
            Navigator.pop(context); // close current bottom sheet

            if (item.onTap != null) {
              item.onTap!(context); // pass the context here
              return;
            }

            if (item.routePage != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => item.routePage!),
              );
            }
          },
        );
      },
    );
  }

  Widget? _buildTrailing(BottomSheetItem item) {
    if (item.trailingIcon != null) {
      return SvgPicture.asset(item.trailingIcon!);
    }

    if (item.trailingIconUrl != null) {
      return Image.network(item.trailingIconUrl!, height: 24, width: 24);
    }

    return null;
  }
}
