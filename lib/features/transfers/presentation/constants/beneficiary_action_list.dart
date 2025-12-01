import 'package:flutter/material.dart';
import 'package:tasks/features/dashbord/domain/models/bottom_sheet_item.dart';
import 'package:tasks/features/transfers/presentation/constants/transfer_type_list.dart';
import '../../../dashbord/presentation/widgets/custom_bottom_sheet.dart';

List<BottomSheetItem> beneficiaryActionItems = [
  BottomSheetItem(
    leadingIcon: "assets/images/transfers.svg",
    label: "Transfer",
    subLabel: "Account within Dukhan Bank",
    onTap: (context) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) =>
            CustomBottomSheet(title: "Transfers", itemList: transferTypesList),
      );
    },
  ),
  BottomSheetItem(
    leadingIcon: "assets/images/standingorder.svg",
    label: "Standing Order",
    subLabel: "Set up repeated payments",
  ),
  BottomSheetItem(
    leadingIcon: "assets/images/edit.svg",
    label: "Edit",
    subLabel: "Update beneficiary details",
  ),
  BottomSheetItem(
    leadingIcon: "assets/images/delete.svg",
    label: "Delete",
    subLabel: "Remove this beneficiary",
  ),
  BottomSheetItem(
    leadingIcon: "assets/images/favourite.svg",
    label: "Favourite",
    subLabel: "Add as a favourite",
  ),
];
