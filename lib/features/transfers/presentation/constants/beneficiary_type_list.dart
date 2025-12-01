import 'package:tasks/features/dashbord/domain/models/bottom_sheet_item.dart';
import 'package:tasks/features/new_beneficiary/presentation/pages/within_dukhan.dart';

List<BottomSheetItem> beneficiaryTypeList = [
  BottomSheetItem(
    leadingIcon: "assets/images/dukhan.svg",
    label: "Within Dukhan",
    routePage: AddBeneficiaryPage(),
  ),
  BottomSheetItem(
    leadingIcon: "assets/images/qatar.svg",
    label: "Within Qatar",
    trailingIcon: "assets/images/qatar2.svg",
  ),
  BottomSheetItem(leadingIcon: "assets/images/fawran.svg", label: "Fawran"),
  BottomSheetItem(
    leadingIcon: "assets/images/international.svg",
    label: "International Transfers",
  ),
  BottomSheetItem(
    leadingIcon: "assets/images/western.svg",
    label: "Western Union",
  ),
];
