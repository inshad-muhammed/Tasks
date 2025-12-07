import 'package:tasks/features/dashbord/domain/models/bottom_sheet_item.dart';

List<BottomSheetItem> transferTypesList = [
  BottomSheetItem(
    leadingIcon: "assets/images/own.svg",
    label: "Within Own Account",
  ),
  BottomSheetItem(
    leadingIcon: "assets/images/dukhan.svg",
    label: "Within Dukhan",
  ),
  BottomSheetItem(
    leadingIcon: "assets/images/qatar.svg",
    label: "Within Qatar",
    trailingIconUrl: "assets/images/qatar2.svg",
  ),

  BottomSheetItem(leadingIcon: "assets/images/fawran.svg", label: "Fawran"),
  BottomSheetItem(
    leadingIcon: "assets/images/cardless.svg",
    label: "Cardless Withdrawal",
  ),
  BottomSheetItem(
    leadingIcon: "assets/images/international.svg",
    label: "International Transfer",
  ),
  BottomSheetItem(
    leadingIcon: "assets/images/western.svg",
    label: "Western Union",
  ),
  BottomSheetItem(
    leadingIcon: "assets/images/date.svg",
    label: "Standing Order",
  ),
  BottomSheetItem(
    leadingIcon: "assets/images/transfers.svg",
    label: "Transfer History",
  ),
];
