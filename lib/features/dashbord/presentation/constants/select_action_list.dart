import 'package:tasks/features/dashbord/domain/models/bottom_sheet_item.dart';
import 'package:tasks/features/transfers/presentation/pages/transfers.dart';

List<BottomSheetItem> selectActionItems = [
  BottomSheetItem(
    leadingIcon: "assets/images/bills.svg",
    label: "Bills",
    subLabel: "Pay your bills",
  ),
  BottomSheetItem(
    leadingIcon: "assets/images/transfers.svg",
    label: "Transfers",
    subLabel: "Domestic and International",
    routePage: TransferPage(),
  ),
  BottomSheetItem(
    leadingIcon: "assets/images/fawran.svg",
    label: "Fawran",
    subLabel: "Realtime Payments",
  ),
  BottomSheetItem(
    leadingIcon: "assets/images/dukhan.svg",
    label: "Dukhan Friends",
    subLabel: "Transfer to contacts",
  ),
];
